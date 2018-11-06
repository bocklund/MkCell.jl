# General vector utilities that may have application outside of MkCell.


"Calculate angle between two vectors (in radians)"
ang(x,y) = acos(dot(x,y)/(norm(x)*norm(y)))


"""Get lattice a, b, c from cell"""
cell_abc(cell) = norm(cell[1,:]), norm(cell[2,:]), norm(cell[3,:])
