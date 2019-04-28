# Test that the maximum sphere radius is correctly calculated

@testset "Maximum sphere radius - fcc" begin
    @test MkCell.score_sphere(fcc1*cellfcc)   ≈ 0.7905694150420949
    @test MkCell.score_sphere(fcc4*cellfcc)   ≈ 0.8660254037844386
    @test MkCell.score_sphere(fcc7*cellfcc)   ≈ 1.118033988749895
    @test MkCell.score_sphere(fcc13*cellfcc)  ≈ 1.50
    @test MkCell.score_sphere(fcc23*cellfcc)  ≈ 1.7677669529663689
    @test MkCell.score_sphere(fcc26*cellfcc)  ≈ 1.7320508075688772
    @test MkCell.score_sphere(fcc32*cellfcc)  ≈ 1.7320508075688772
    @test MkCell.score_sphere(fcc38*cellfcc)  ≈ 1.8708286933869707
    @test MkCell.score_sphere(fcc50*cellfcc)  ≈ 2.1213203435596424
    @test MkCell.score_sphere(fcc70*cellfcc)  ≈ 2.4238399287081647
    @test MkCell.score_sphere(fcc92*cellfcc)  ≈ 2.5495097567963922
    @test MkCell.score_sphere(fcc96*cellfcc)  ≈ 2.500
    @test MkCell.score_sphere(fcc100*cellfcc) ≈ 2.692582403567252
    @test MkCell.score_sphere(fcc108*cellfcc) ≈ 2.598076211353316
end;
@testset "Maximum sphere radius - cubic" begin
    @test MkCell.score_sphere(cubic1*cellcubic)   ≈ 0.8660254037844386
    @test MkCell.score_sphere(cubic3*cellcubic)   ≈ 1.50
    @test MkCell.score_sphere(cubic7*cellcubic)   ≈ 2.0615528128088303
    @test MkCell.score_sphere(cubic8*cellcubic)   ≈ 1.7320508075688772
    @test MkCell.score_sphere(cubic13*cellcubic)  ≈ 2.29128784747792
    @test MkCell.score_sphere(cubic14*cellcubic)  ≈ 2.23606797749979
    @test MkCell.score_sphere(cubic24*cellcubic)  ≈ 2.50
    @test MkCell.score_sphere(cubic27*cellcubic)  ≈ 2.598076211353316
    @test MkCell.score_sphere(cubic33*cellcubic)  ≈ 2.8722813232690143
    @test MkCell.score_sphere(cubic38*cellcubic)  ≈ 3.2015621187164243
    @test MkCell.score_sphere(cubic52*cellcubic)  ≈ 3.24037034920393
    @test MkCell.score_sphere(cubic56*cellcubic)  ≈ 3.500
    @test MkCell.score_sphere(cubic64*cellcubic)  ≈ 3.4641016151377544
    @test MkCell.score_sphere(cubic73*cellcubic)  ≈ 3.905124837953327
    @test MkCell.score_sphere(cubic76*cellcubic)  ≈ 3.7416573867739413
    @test MkCell.score_sphere(cubic93*cellcubic)  ≈ 4.06201920231798
    @test MkCell.score_sphere(cubic100*cellcubic) ≈ 4.031128874149275
end;
@testset "Maximum sphere radius - bcc" begin
    # No idea what's going on with these cells.
    @test MkCell.score_sphere(bcc1*cellbcc)   ≈ 0.82915619758885
    @test MkCell.score_sphere(bcc2*cellbcc)   ≈ 0.8660254037844386
    @test MkCell.score_sphere(bcc6*cellbcc)   ≈ 1.479019945774904
    @test MkCell.score_sphere(bcc9*cellbcc)   ≈ 1.479019945774904
    @test MkCell.score_sphere(bcc16*cellbcc)  ≈ 1.7320508075688772
    @test MkCell.score_sphere(bcc21*cellbcc)  ≈ 2.0615528128088303
    @test MkCell.score_sphere(bcc25*cellbcc)  ≈ 2.277608394786075
    @test MkCell.score_sphere(bcc28*cellbcc)  ≈ 2.23606797749979
    @test MkCell.score_sphere(bcc35*cellbcc)  ≈ 2.277608394786075
    @test MkCell.score_sphere(bcc48*cellbcc)  ≈ 2.50
    @test MkCell.score_sphere(bcc53*cellbcc)  ≈ 2.8613807855648994
    @test MkCell.score_sphere(bcc54*cellbcc)  ≈ 2.598076211353316
    @test MkCell.score_sphere(bcc65*cellbcc)  ≈ 3.031088913245535
    @test MkCell.score_sphere(bcc84*cellbcc)  ≈ 3.112474899497183
    @test MkCell.score_sphere(bcc91*cellbcc)  ≈ 3.112474899497183
    @test MkCell.score_sphere(bcc103*cellbcc) ≈ 3.344772040064913
    @test MkCell.score_sphere(bcc107*cellbcc) ≈ 3.418698582794336
    @test MkCell.score_sphere(bcc112*cellbcc) ≈ 3.418698582794336
    @test MkCell.score_sphere(bcc128*cellbcc) ≈ 3.4641016151377544
end;
@testset "Maximum sphere radius - hcp" begin
    # @test MkCell.score_sphere(hcp1*cellhcp) ≈ 0.668
    # @test MkCell.score_sphere(hcp3*cellhcp) ≈ 0.958
    # @test MkCell.score_sphere(hcp6*cellhcp) ≈ 1.075
    # @test MkCell.score_sphere(hcp11*cellhcp) ≈ 1.365
    # @test MkCell.score_sphere(hcp14*cellhcp) ≈ 1.476
    # @test MkCell.score_sphere(hcp80*cellhcp) ≈ 2.398
end;
