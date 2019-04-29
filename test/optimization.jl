# Optimization tests

@testset "Optimization tests" begin
@testset "fcc 7" begin
	fcc7 = MkCell.cellopt(cellfcc, 7, 2)
    # best cell
    @test fcc7[1] ≈ [-0.5 -1.0 -0.5; -0.5 0.5 -1.0; 1.0 -0.5 -0.5]
    # best matrix
    @test fcc7[2] ≈ [1.0 -2.0 0.0; -1.0 -1.0 2.0; -1.0 0.0 -1.0]
    score_tuple = fcc7[3]
    @test score_tuple[1] ≈ 1.118033988749895  # Rmax
    @test score_tuple[2] ≈ 1.224744871391589  # dmin
    @test score_tuple[3] ≈ 0.08411657770309003  # angle deviation
    @test score_tuple[4] ≈ 0.0  # length deviation
end;
@testset "cubic 13" begin
	cubic13 = MkCell.cellopt(cellcubic, 13, 2)
    # best cell
    @test cubic13[1] ≈ [2.0 -1.0 -1.0; -1.0 -2.0 -1.0; 0.0 1.0 -2.0]
    # best matrix
    @test cubic13[2] ≈ [2.0 -1.0 -1.0; -1.0 -2.0 -1.0; 0.0 1.0 -2.0]
    score_tuple = cubic13[3]
    @test score_tuple[1] ≈ 2.29128784747792  # Rmax
    @test score_tuple[2] ≈ 2.23606797749979  # dmin
    @test score_tuple[3] ≈ 0.06174929182486454  # angle deviation
    @test score_tuple[4] ≈ 0.09109769979335518  # length deviation
end;
end;
