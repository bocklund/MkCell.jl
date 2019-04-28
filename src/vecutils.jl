# General vector utilities that may have application outside of MkCell.


"Calculate angle between two vectors (in radians)"
ang(x,y) = acos(dot(x,y)/(norm(x)*norm(y)))


"""Get lattice a, b, c from cell"""
cell_abc(cell) = norm(cell[1,:]), norm(cell[2,:]), norm(cell[3,:])

"""Get cell angles α, β, γ (in degrees) from a cell."""
cell_angles(cell) = tuple((ang(cell[p[1],:], cell[p[2],:])*180.0/π for p in [(2,3), (1,3), (1,2)])...)
