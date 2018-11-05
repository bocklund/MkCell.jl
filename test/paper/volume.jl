# Test that the volumes of the supercells are correct compared to the lattice.
# Mostly a sanity check to make sure the lattices are correc.

@testset "Supercell volumes" begin
    Vfcc = abs(det(cellfcc))
    @test abs(det(fcc1*cellfcc))/Vfcc ≈ 1.0
    @test abs(det(fcc4*cellfcc))/Vfcc ≈ 4.0
    @test abs(det(fcc7*cellfcc))/Vfcc ≈ 7.0
    @test abs(det(fcc13*cellfcc))/Vfcc ≈ 13.0
    @test abs(det(fcc23*cellfcc))/Vfcc ≈ 23.0
    @test abs(det(fcc32*cellfcc))/Vfcc ≈ 32.0

    Vcubic = abs(det(cellcubic))
    @test abs(det(cubic1*cellcubic))/Vcubic ≈ 1.0
    @test abs(det(cubic3*cellcubic))/Vcubic ≈ 3.0
    @test abs(det(cubic7*cellcubic))/Vcubic ≈ 7.0
    @test abs(det(cubic13*cellcubic))/Vcubic ≈ 13.0
    @test abs(det(cubic24*cellcubic))/Vcubic ≈ 24.0
    @test abs(det(cubic27*cellcubic))/Vcubic ≈ 27.0

    Vbcc = abs(det(cellbcc))
    @test abs(det(bcc1*cellbcc))/Vbcc ≈ 1.0
    @test abs(det(bcc2*cellbcc))/Vbcc ≈ 2.0
    @test abs(det(bcc6*cellbcc))/Vbcc ≈ 6.0
    @test abs(det(bcc16*cellbcc))/Vbcc ≈ 16.0
    @test abs(det(bcc25*cellbcc))/Vbcc ≈ 25.0
    @test abs(det(bcc48*cellbcc))/Vbcc ≈ 48.0

    Vhcp = abs(det(cellhcp))
    @test abs(det(hcp1*cellhcp))/Vhcp ≈ 1.0
    @test abs(det(hcp3*cellhcp))/Vhcp ≈ 3.0
    @test abs(det(hcp6*cellhcp))/Vhcp ≈ 6.0
    @test abs(det(hcp11*cellhcp))/Vhcp ≈ 11.0
    @test abs(det(hcp14*cellhcp))/Vhcp ≈ 14.0
    @test abs(det(hcp80*cellhcp))/Vhcp ≈ 80.0

end;
