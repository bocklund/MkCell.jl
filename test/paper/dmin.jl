# Test that the minimum image distance is correctly calculated

@testset "Minimum image distance - fcc" begin
    @test MkCell.score_image_distance(fcc1*cellfcc)   ≈ 0.7071067811865476
    @test MkCell.score_image_distance(fcc4*cellfcc)   ≈ 1.000
    @test MkCell.score_image_distance(fcc7*cellfcc)   ≈ 1.224744871391589
    @test MkCell.score_image_distance(fcc13*cellfcc)  ≈ 1.5811388300841898
    @test MkCell.score_image_distance(fcc23*cellfcc)  ≈ 1.7320508075688772
    @test MkCell.score_image_distance(fcc26*cellfcc)  ≈ 1.8708286933869707
    @test MkCell.score_image_distance(fcc32*cellfcc)  ≈ 2.000
    @test MkCell.score_image_distance(fcc38*cellfcc)  ≈ 2.1213203435596424
    @test MkCell.score_image_distance(fcc50*cellfcc)  ≈ 2.345207879911715
    @test MkCell.score_image_distance(fcc70*cellfcc)  ≈ 2.5495097567963922
    @test MkCell.score_image_distance(fcc92*cellfcc)  ≈ 2.7386127875258306
    @test MkCell.score_image_distance(fcc96*cellfcc)  ≈ 2.8284271247461903
    @test MkCell.score_image_distance(fcc100*cellfcc) ≈ 2.9154759474226504
    @test MkCell.score_image_distance(fcc108*cellfcc) ≈ 3.000
end;
@testset "Minimum image distance - cubic" begin
    @test MkCell.score_image_distance(cubic1*cellcubic)   ≈ 1.000
    @test MkCell.score_image_distance(cubic3*cellcubic)   ≈ 1.4142135623730951
    @test MkCell.score_image_distance(cubic7*cellcubic)   ≈ 1.7320508075688772
    @test MkCell.score_image_distance(cubic8*cellcubic)   ≈ 2.000
    @test MkCell.score_image_distance(cubic13*cellcubic)  ≈ 2.23606797749979
    @test MkCell.score_image_distance(cubic14*cellcubic)  ≈ 2.449489742783178
    @test MkCell.score_image_distance(cubic24*cellcubic)  ≈ 2.8284271247461903
    @test MkCell.score_image_distance(cubic27*cellcubic)  ≈ 3.000
    @test MkCell.score_image_distance(cubic33*cellcubic)  ≈ 3.1622776601683795
    @test MkCell.score_image_distance(cubic38*cellcubic)  ≈ 3.3166247903554
    @test MkCell.score_image_distance(cubic52*cellcubic)  ≈ 3.605551275463989
    @test MkCell.score_image_distance(cubic56*cellcubic)  ≈ 3.7416573867739413
    @test MkCell.score_image_distance(cubic64*cellcubic)  ≈ 4.000
    @test MkCell.score_image_distance(cubic73*cellcubic)  ≈ 4.123105625617661
    @test MkCell.score_image_distance(cubic76*cellcubic)  ≈ 4.242640687119285
    @test MkCell.score_image_distance(cubic93*cellcubic)  ≈ 4.358898943540674
    @test MkCell.score_image_distance(cubic100*cellcubic) ≈ 4.47213595499958
end;
@testset "Minimum image distance - bcc" begin
    @test MkCell.score_image_distance(bcc1*cellbcc)   ≈ 0.8660254037844386
    @test MkCell.score_image_distance(bcc2*cellbcc)   ≈ 1.000
    @test MkCell.score_image_distance(bcc6*cellbcc)   ≈ 1.4142135623730951
    @test MkCell.score_image_distance(bcc9*cellbcc)   ≈ 1.6583123951777
    @test MkCell.score_image_distance(bcc16*cellbcc)  ≈ 2.000
    @test MkCell.score_image_distance(bcc21*cellbcc)  ≈ 2.179449471770337
    @test MkCell.score_image_distance(bcc25*cellbcc)  ≈ 2.23606797749979
    @test MkCell.score_image_distance(bcc28*cellbcc)  ≈ 2.449489742783178
    @test MkCell.score_image_distance(bcc35*cellbcc)  ≈ 2.598076211353316
    @test MkCell.score_image_distance(bcc48*cellbcc)  ≈ 2.8284271247461903
    @test MkCell.score_image_distance(bcc53*cellbcc)  ≈ 2.958039891549808
    @test MkCell.score_image_distance(bcc54*cellbcc)  ≈ 3.000
    @test MkCell.score_image_distance(bcc65*cellbcc)  ≈ 3.278719262151
    @test MkCell.score_image_distance(bcc84*cellbcc)  ≈ 3.3166247903554
    @test MkCell.score_image_distance(bcc91*cellbcc)  ≈ 3.570714214271425
    @test MkCell.score_image_distance(bcc103*cellbcc) ≈ 3.605551275463989
    @test MkCell.score_image_distance(bcc107*cellbcc) ≈ 3.7416573867739413
    @test MkCell.score_image_distance(bcc112*cellbcc) ≈ 3.840572873934304
    @test MkCell.score_image_distance(bcc128*cellbcc) ≈ 4.000

end;
@testset "Minimum image distance - hcp" begin
    # @test MkCell.score_image_distance(hcp1*cellhcp) ≈ 0.561
    # @test MkCell.score_image_distance(hcp3*cellhcp) ≈ 0.916
    # @test MkCell.score_image_distance(hcp6*cellhcp) ≈ 0.972
    # @test MkCell.score_image_distance(hcp11*cellhcp) ≈ 1.336
    # @test MkCell.score_image_distance(hcp14*cellhcp) ≈ 1.449
    # @test MkCell.score_image_distance(hcp80*cellhcp) ≈ 2.672
end;
