# Optimization tests

@testset "Optimization tests" begin
@testset "fcc 7" begin
	fcc7 = MkCell.cellopt(cellfcc, 7, 2)
    # best cell
    bestcell = fcc7[1]
    @test bestcell ≈ [-0.5 -1.0 -0.5; -0.5 0.5 -1.0; 1.0 -0.5 -0.5]
    @test abs(det(bestcell)) ≈ 7.0*abs(det(cellfcc))
    # best matrix
    @test fcc7[2] ≈ [1.0 -2.0 0.0; -1.0 -1.0 2.0; -1.0 0.0 -1.0]
    score_tuple = fcc7[3]
    @test MkCell.score_sphere(bestcell) ≈ 1.118033988749895  # Rmax
    @test MkCell.score_image_distance(bestcell) ≈ 1.224744871391589  # dmin
    @test MkCell.score_angles_cell(bestcell) ≈ 0.08411657770309003  # angle deviation
    @test MkCell.score_lengths_cell(bestcell) ≈ 0.0  # length deviation
end;
@testset "cubic 13" begin
	cubic13 = MkCell.cellopt(cellcubic, 13, 2)
    # best cell
    bestcell = cubic13[1]
    @test bestcell ≈ [2.0 -1.0 -1.0; -1.0 -2.0 -1.0; 0.0 1.0 -2.0]
    @test abs(det(bestcell)) ≈ 13.0*abs(det(cellcubic))
    # best matrix
    @test cubic13[2] ≈ [2.0 -1.0 -1.0; -1.0 -2.0 -1.0; 0.0 1.0 -2.0]
    score_tuple = cubic13[3]
    @test MkCell.score_sphere(bestcell) ≈ 2.29128784747792  # Rmax
    @test MkCell.score_image_distance(bestcell) ≈ 2.23606797749979  # dmin
    @test MkCell.score_angles_cell(bestcell) ≈ 0.06174929182486454  # angle deviation
    @test MkCell.score_lengths_cell(bestcell) ≈ 0.09109769979335518  # length deviation
end;
end;
