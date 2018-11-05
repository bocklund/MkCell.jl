# General vector utilities that may have application outside of MkCell.


"Calculate angle between two vectors (in radians)"
ang(x,y) = acos(dot(x,y)/(norm(x)*norm(y)))

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

"""Get lattice a, b, c from cell"""
cell_abc(cell) = norm(cell[1,:]), norm(cell[2,:]), norm(cell[3,:])
