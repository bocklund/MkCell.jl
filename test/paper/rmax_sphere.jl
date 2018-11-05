# Test that the maximum sphere radius is correctly calculated

@testset "Maximum sphere radius" begin
    @test MkCell.score_sphere(fcc1*cellfcc) ≈ 0.7905694150420949
    @test MkCell.score_sphere(fcc4*cellfcc) ≈ 0.8660254037844386
    @test MkCell.score_sphere(fcc7*cellfcc) ≈ 1.118033988749895
    @test MkCell.score_sphere(fcc13*cellfcc) ≈ 1.50
    @test MkCell.score_sphere(fcc23*cellfcc) ≈ 1.7677669529663689
    @test MkCell.score_sphere(fcc32*cellfcc) ≈ 1.7320508075688772

    @test MkCell.score_sphere(cubic1*cellcubic) ≈ 0.8660254037844386
    @test MkCell.score_sphere(cubic3*cellcubic) ≈ 1.50
    @test MkCell.score_sphere(cubic7*cellcubic) ≈ 2.0615528128088303
    @test MkCell.score_sphere(cubic13*cellcubic) ≈ 2.29128784747792
    @test MkCell.score_sphere(cubic24*cellcubic) ≈ 2.50
    @test MkCell.score_sphere(cubic27*cellcubic) ≈ 2.598076211353316

    @test MkCell.score_sphere(bcc1*cellbcc) ≈ 0.829
    @test MkCell.score_sphere(bcc2*cellbcc) ≈ 0.866
    @test MkCell.score_sphere(bcc6*cellbcc) ≈ 1.479
    @test MkCell.score_sphere(bcc16*cellbcc) ≈ 1.732
    @test MkCell.score_sphere(bcc25*cellbcc) ≈ 2.062
    @test MkCell.score_sphere(bcc48*cellbcc) ≈ 2.50

    @test MkCell.score_sphere(hcp1*cellhcp) ≈ 0.668
    @test MkCell.score_sphere(hcp3*cellhcp) ≈ 0.958
    @test MkCell.score_sphere(hcp6*cellhcp) ≈ 1.075
    @test MkCell.score_sphere(hcp11*cellhcp) ≈ 1.365
    @test MkCell.score_sphere(hcp14*cellhcp) ≈ 1.476
    @test MkCell.score_sphere(hcp80*cellhcp) ≈ 2.398

end;
