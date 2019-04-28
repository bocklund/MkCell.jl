using Test, LinearAlgebra, MkCell

# testing data
include("primtive_cells.jl")
include("paper/lattice_data.jl")

# tests
include("paper/volume.jl")
include("paper/angles.jl")
include("paper/rmax_sphere.jl")
include("paper/dmin.jl")

