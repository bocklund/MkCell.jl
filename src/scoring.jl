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
