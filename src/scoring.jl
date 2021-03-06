"Return an array of the unique angles for three vectors `a`, `b`, and `c`."
function angles_abc(a, b, c)
    return ang(a, b), ang(a, c), ang(b, c)
end # function

"""
Score distortion of cell angles from 90 degrees as a sum of squares.

Higher scores indicate larger deviations from 90 degrees.
"""
function score_angles_cell(cell)
    ab, ac, bc = angles_abc(cell[1,:], cell[2,:], cell[3,:])
    return (ab-π/2)^2 + (ac-π/2)^2 + (bc-π/2)^2
end

"""
Score the lengths of the unique vectors `a`, `b`, and `c` pairwise as sum of square differences.
"""
function score_lengths_abc(a, b, c)
    ab = norm(a) - norm(b)
    ac = norm(a) - norm(c)
    bc = norm(b) - norm(c)
    return (ab^2 + ac^2 + bc^2)
end # function

"""
Score the lengths of a cell's vectors pairwise as sum of square differences.
"""
score_lengths_cell(cell) = score_lengths_abc(cell[1,:], cell[2,:], cell[3,:])

const M1TO1 = [-1, 0, 1]
"""
Score based on the maximum radius of a sphere needed to contain the whole cell.

The smallest sphere (lowest score) gives the most compact cell. The radius of
the sphere needed is given by the maximum distance of any cell corner to the
center of the cell.

As given by equation (3) by Militzer.
"""
function score_sphere(cell)
    score = -Inf
    for i=M1TO1, j=M1TO1, k=M1TO1
        candidate = 0.5*norm(i*cell[1,:]+j*cell[2,:]+k*cell[3,:])
        score = max(score, candidate)
    end # for
    return score
end #function


const PREV_NAN = MVector{3}(Array{Float64}(undef, 3))
"""
Redefine the lattice vectors of a cell to point to the next nearest image
See equations (5)-(7) by Militzer.
"""
function closestimagevectors(cell)
    a, b, c = cell[1,:], cell[2,:], cell[3,:]

    prev_b = PREV_NAN
    prev_c = PREV_NAN
    while b != prev_b && c != prev_c
        a, b, c = sort([a, b, c], by=norm)
        prev_b[:] = b
        prev_c[:] = c

        b = b - a*round(dot(b,a)/dot(a,a), RoundNearestTiesUp)
        c = c - a*round(dot(c,a)/dot(a,a), RoundNearestTiesUp)
        c = c - b*round(dot(c,b)/dot(b,b), RoundNearestTiesUp)
    end # while

    return a, b, c
end # function


"""
Score based on the minimum distance to the next image.

The cell with the largest minimum image distance (maximizing peroidic distances)
is optimal. Solves equation (4) given by Militzer.
"""
function score_image_distance(cell)
    a, b, c = closestimagevectors(cell)
    score = Inf
    for i=M1TO1, j=M1TO1, k=M1TO1
        if (i^2 + j^2 + k^2) > 0
            candidate = norm(i*a + j*b + k*c)
            score = min(score, candidate)
        end # if
    end # for
    return score
end # function

"""
The score is the negative of the minimum distance to the next image, so that the largest distance is the minimum.
"""
score_image_distance_min(cell) = -score_image_distance(cell)

"""
Compare the scores for two differenct cells by the scoring function.

Returns true if an optimal cell has been assigned, false if no optimal cell is found (scores are tied).

Modifies the score arrays and the optimal cell and matrix in place.
"""
function compare_cell_scores!(scorefunc, optcell, candcell, optscore, candscore, optmatrix, candmatrix, idx)
    optsc = isnan(optscore[idx]) ? scorefunc(optcell) : optscore[idx]
    optscore[idx] = optsc
    candsc = scorefunc(candcell)
    candscore[idx] = candsc
    if optsc != candsc
        # we can choose the cell with the minimum sphere size
        if argmin((optsc, candsc)) == 1
            # optimum cell stays the same
            return true
        else
            # candidate cell is better
            optcell[:,:] = candcell
            optmatrix[:,:] = candmatrix
            optscore[:] = candscore[:]
            return true
        end # if
    else
        return false
    end # if
end # function

const SCOREFUNCS = [score_sphere, score_image_distance_min, score_angles_cell, score_lengths_cell]
const NSCOREFUNCS = length(SCOREFUNCS)
const CANDSCORES = Array{Float64}(undef, NSCOREFUNCS)
"""
Loop through scoring criteria functions to find the optimal cell in a pairwise comparison.

Generally speaking, scoring should be as lazy as possible and only progress
through the scoring criteria as necessary.

This method modifies the optimal cell and score with the optimal values found.

"""
function cellchoose!(optcell, optscore, candcell, best_matrix, cur_matrix)
    candscore = CANDSCORES
    for i=1:NSCOREFUNCS
        candscore[i] = NaN
    end
    for i=1:NSCOREFUNCS
        optimum_found = compare_cell_scores!(SCOREFUNCS[i], optcell, candcell, optscore, candscore, best_matrix, cur_matrix, i)
        if optimum_found
            return
        end # if
    end #for
    # these cells are equivalent, just return (keeping the original best cell)
    return
end # function
