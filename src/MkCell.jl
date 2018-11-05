"""
MkCell provides functions for calculating optimal supercells.

Based on the description of the approach given by
    > B. Militzer, High Energy Density Phys. 21 (2016) 8–15. doi:10.1016/j.hedp.2016.09.003
"""
module MkCell

export cellopt

using LinearAlgebra

include("vecutils.jl")
include("scoring.jl")

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
    Vsuper = det(cell)*m  # target supercell volume
    count = 0;
    best_cell = Array{Float64}(undef, 3, 3)
    # The first value should be set to infinity so that it will always be
    # higher than the current cell for the first iteration.
    best_cell_score = [Inf NaN NaN NaN]
    cur_cell = Array{Float64}(undef, 3, 3)
    best_matrix = Array{Float64}(undef, 3, 3)
    cur_matrix = Array{Float64}(undef, 3, 3)
    asuper = Array{Float64}(undef, 3);
    bsuper = Array{Float64}(undef, 3);
    csuper = Array{Float64}(undef, 3);
    for ia=1:n, ja=-n:n, ka=-n:n
        asuper[:] = [ia ja ka]*cell;
        if norm(asuper) <= 0
            continue
        end # if
        for ib=-ia:ia, jb=-n:n, kb=-n:n
            bsuper[:] = [ib jb kb]*cell;
            if norm(bsuper) <= 0
                continue
            end # if

            aib = abs(ib)
            ajb = abs(jb)
            for ic=-aib:aib, jc=-ajb:ajb, kc=1:n
                csuper[:] = [ic jc kc]*cell;
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
    # reverse the sign of dmin so that it's positive, consistent with reality
    best_cell_score[2] = -best_cell_score[2]
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

# TODO: benchmark for maximum performance.
end # module
