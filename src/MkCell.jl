"""
MkCell provides functions for calculating optimal supercells.

Based on the description of the approach given by
    > B. Militzer, High Energy Density Phys. 21 (2016) 8–15. doi:10.1016/j.hedp.2016.09.003
"""
module MkCell

export cellopt

using LinearAlgebra

"Calculate angle between two vectors (in radians)"
ang(x,y) = acos(dot(x,y)/(norm(x)*norm(y)))

"Return an array of the unique angles for three vectors `a`, `b`, and `c`."
function angles_abc(a, b, c)
    return [ang(a, b) ang(a, c) ang(b, c)]
end # function

"""
Score distortion of cell angles from 90 degrees as a sum of squares.

Higher scores indicate larger deviations from 90 degrees.
"""
score_angles_cell(cell) = sum((angles_abc(cell[1,:], cell[2,:], cell[3,:]).-π/2).^2)

"""
Score the lengths of the unique vectors `a`, `b`, and `c` pairwise as sum of square differences.
"""
function score_lengths_abc(a, b, c)
    ab = norm(a) - norm(b)
    ac = norm(a) - norm(c)
    bc = norm(b) - norm(c)
    return sum([ab ac bc].^2)
end # function

"""
Score the lengths of a cell's vectors pairwise as sum of square differences.
"""
score_lengths_cell(cell) = score_lengths_abc(cell[1,:], cell[2,:], cell[3,:])

"""
Score based on the maximum radius of a sphere needed to contain the whole cell.

The smallest sphere (lowest score) gives the most compact cell. The radius of
the sphere needed is given by the maximum distance of any cell corner to the
center of the cell.

As given by equation (3) by Militzer.
"""
function score_sphere(cell)
    score = -Inf
    for i=-1:1, j=-1:1, k=-1:1
        candidate = 0.5*norm([i j k]*cell')
        score = max(score, candidate)
    end # for
    return score
end #function


"""
Order three vectors `a`, `b`, `c` such that `a <= b <= c`.
"""
function ordervectors(a, b, c)
    l1 = a
    l2 = b
    l3 = c
    lengths = [norm(x) for x in (l1, l2, l3)]
    min_index = argmin(lengths)
    max_index = argmax(lengths)
    if min_index == 1
        if max_index == 3
            a = l1; b = l2; c = l3
        else  # max index is 2
            a = l1; b = l3; c = l2
        end # if
    elseif min_index == 2
        if max_index == 1
            a = l2; b = l3; c = l1
        else  # max index is 3
            a = l2; b = l1; c = l3
        end # if
    else  # min_index == 3
        if max_index == 1
            a = l3; b = l2; c = l1
        else # max_index == 2
            a = l3; b = l1; c = l2
        end # if
    end # if
    return a, b, c
end # function

"""
Redefine the lattice vectors of a cell to point to the next nearest image
See equations (5)-(7) by Militzer.
"""
function closestimagevectors(cell)
    a, b, c = ordervectors(cell[1,:], cell[2,:], cell[3,:])

    prev_b = [NaN NaN NaN]
    prev_c = [NaN NaN NaN]
    while b != prev_b && c != prev_c
        prev_b = b
        prev_c = c

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
    for i=-1:1, j=-1:1, k=-1:1
        if (i^2 + j^2 + k^2) > 0
            candidate = norm([i j k]*[a b c ])
            score = min(score, candidate)
        end # if
    end # for
    return score
end # function

"""
Succesively score a candidate supercell and compare it to the current optimal supercell.

Generally speaking, scoring should be as lazy as possible and only progress
through the scoring criteria as necessary.

This method modifies the optimal cell and score with the optimal values found.

"""
function cellchoose!(optcell, optscore, candidate_cell, best_matrix, cur_matrix)
    # TODO: this code could be refactored to use a function that takes a generic scoring function and the cells to do the comparison/updating

    # score based on minimum sphere radius
    opt1 = optscore[1] # must be a number
    cand1 = score_sphere(candidate_cell)
    if opt1 != cand1
        # we can choose the cell with the minimum sphere size
        if argmin([opt1, cand1]) == 1
            # optimum cell stays the same
            return
        else
            # candidate cell is better
            optcell[:,:] = candidate_cell
            best_matrix[:,:] = cur_matrix
            optscore[:] = [Inf -Inf Inf Inf] # reset the scores
            optscore[1] = cand1 # set the first score
            return
        end # if
    end #if

    # since the sphere scores are tied, we must score based on minimum image distance
    opt2 = isnan(optscore[2]) ? score_image_distance(optcell) : optscore[2]
    cand2 = score_image_distance(candidate_cell)
    if opt2 != cand2
        # we can choose the cell with the minimum sphere size
        if argmax([opt2, cand2]) == 1
            # optimum cell stays the same
            optscore[2] = opt2
            return
        else
            # candidate cell is better
            optcell[:,:] = candidate_cell
            best_matrix[:,:] = cur_matrix
            optscore[:] = [Inf -Inf Inf Inf] # reset the scores
            optscore[1] = cand1 # set the first score
            optscore[2] = cand2 # set the second score
            return
        end # if
    end # if

    # compare cell angle deviations from 90 degrees
    opt3 = isnan(optscore[3]) ? score_angles_cell(optcell) : optscore[3]
    cand3 = score_angles_cell(candidate_cell)
    if opt3 != cand3
        if argmin([opt3, cand3]) == 1
            # optimum cell stays the same
            optscore[3] = opt3
            return
        else
            # candidate cell is better
            optcell[:,:] = candidate_cell
            best_matrix[:,:] = cur_matrix
            optscore[:] = [Inf -Inf Inf Inf] # reset the scores
            optscore[1] = cand1 # set the first score
            optscore[2] = cand2 # set the second score
            optscore[3] = cand3 # set the third score
            return
        end # if
    end #if

    # compare cell length deviations from each other
    opt4 = isnan(optscore[4]) ? score_lengths_cell(optcell) : optscore[4]
    cand4 = score_lengths_cell(candidate_cell)
    if opt4 != cand4
        if argmin([opt4, cand4]) == 1
            # optimum cell stays the same
            optscore[4] = opt4
            return
        else
            # candidate cell is better
            optcell[:,:] = candidate_cell
            best_matrix[:,:] = cur_matrix
            optscore[:] = [Inf -Inf Inf Inf] # reset the scores
            optscore[1] = cand1 # set the first score
            optscore[2] = cand2 # set the second score
            optscore[3] = cand3 # set the third score
            optscore[4] = cand4 # set the fourth score
            return
        end # if
    end #if

    # these cells are equivalent, just return (keeping the original best cell)
    # println("Tie, current matrix ", cur_matrix)
    return
end # function

"""
Find an optimal supercell by scaling `cell` by `m` unit cells, searching over
a 3x3 supercell matrix where each element ranges from `-n` to `+n`.

This function follows the approach described by
    > B. Militzer, High Energy Density Phys. 21 (2016) 8–15. doi:10.1016/j.hedp.2016.09.003

An optimal cell is chosen according to the following four criteria:
1. Minimizing the sphere radius required to contain the supercell
2. Maximizing the periodic distance between images
3. Minimizing the distortion of the supercell angles from 90 degrees
4. Minimizing the difference in lattice vector length
"""
function cellopt(cell, m, n; verbose=false)
    Vsuper = det([a; b; c])*m  # target supercell volume
    count = 0;
    best_cell = Array{Float64}(undef, 3, 3)  # current best cell
    best_cell_score = [Inf -Inf Inf Inf] # score of the current best cell
    cur_cell = Array{Float64}(undef, 3, 3)
    best_matrix = Array{Float64}(undef, 3, 3)
    cur_matrix = Array{Float64}(undef, 3, 3)
    for ia=1:n, ja=-n:n, ka=-n:n
        asuper = ia*a + ja*b + ka*c;
        if norm(asuper) <= 0
            continue
        end # if
        for ib=-ia:ia, jb=-n:n, kb=-n:n
            bsuper = ib*a + jb*b + kb*c;
            if norm(bsuper) <= 0
                continue
            end # if

            aib = abs(ib)
            ajb = abs(jb)
            for ic=-aib:aib, jc=-ajb:ajb, kc=1:n
                csuper = ic*a + jc*b + kc*c;
                if norm(csuper) <= 0
                    continue
                end # if
                cur_matrix[:,:] = [ ia ja ka; ib jb kb; ic jc kc]
                cur_cell[:,:] = [asuper; bsuper; csuper]
                Vsuper_calc = det(cur_cell);
                if Vsuper_calc != Vsuper
                    continue
                end # if
                # This is a valid supercell, now try to determine if it's the optimal cell so far
                cellchoose!(best_cell, best_cell_score, cur_cell, best_matrix, cur_matrix)
                count = count + 1;
            end # for
        end # for
    end # for
    if verbose
        as = best_cell[1,:]
        bs = best_cell[2,:]
        cs = best_cell[3,:]
        println("Best cell", best_cell)
        println("a b c ", norm(as), " ", norm(bs), " ", norm(cs))
        println("α β γ (°) ", ang(as, bs)*180/π, " ", ang(as, cs)*180/π, " ", ang(bs, cs)*180/π)
        println("Matrix ", best_matrix)
        println("Rmax ", best_cell_score[1])
        println("dmin ", best_cell_score[2])
        println("Angle deviation ", best_cell_score[3])
        println("Length deviation ", best_cell_score[4])
        println("Cells considered ", count)

    end
    return best_cell, best_matrix, best_cell_score, count
end # function

# TODO: add a function that can calculate optimal cells over a range of unit cells
# multiples to determine which multiples have dmin larger than all smaller cells
end # module
