# Test that the minimum image distance is correctly calculated

@testset "Minimum image distance" begin
    @test MkCell.score_image_distance(fcc1*cellfcc) ≈ 0.7071067811865476
    @test MkCell.score_image_distance(fcc4*cellfcc) ≈ 1.0
    @test MkCell.score_image_distance(fcc7*cellfcc) ≈ 1.224744871391589
    @test MkCell.score_image_distance(fcc13*cellfcc) ≈ 1.5811388300841898
    @test MkCell.score_image_distance(fcc23*cellfcc) ≈ 1.7320508075688772
    @test MkCell.score_image_distance(fcc32*cellfcc) ≈ 2.00

    @test MkCell.score_image_distance(cubic1*cellcubic) ≈ 1.0
    @test MkCell.score_image_distance(cubic3*cellcubic) ≈ 1.4142135623730951
    @test MkCell.score_image_distance(cubic7*cellcubic) ≈ 1.7320508075688772
    @test MkCell.score_image_distance(cubic13*cellcubic) ≈ 2.23606797749979
    @test MkCell.score_image_distance(cubic24*cellcubic) ≈ 2.8284271247461903
    @test MkCell.score_image_distance(cubic27*cellcubic) ≈ 3.0

    # No idea what's going on with these cells.
    # @test MkCell.score_image_distance(bcc1*cellbcc) ≈ 0.8660254037844386
    # @test MkCell.score_image_distance(bcc2*cellbcc) ≈ 1.0
    # @test MkCell.score_image_distance(bcc6*cellbcc) ≈ 1.414
    # @test MkCell.score_image_distance(bcc16*cellbcc) ≈ 2.0
    # @test MkCell.score_image_distance(bcc25*cellbcc) ≈ 2.236
    # @test MkCell.score_image_distance(bcc48*cellbcc) ≈ 2.828
    #
    # @test MkCell.score_image_distance(hcp1*cellhcp) ≈ 0.561
    # @test MkCell.score_image_distance(hcp3*cellhcp) ≈ 0.916
    # @test MkCell.score_image_distance(hcp6*cellhcp) ≈ 0.972
    # @test MkCell.score_image_distance(hcp11*cellhcp) ≈ 1.336
    # @test MkCell.score_image_distance(hcp14*cellhcp) ≈ 1.449
    # @test MkCell.score_image_distance(hcp80*cellhcp) ≈ 2.672

end;
