# Test that the volumes of the supercells are correct compared to the lattice.
# Mostly a sanity check to make sure the lattices are correc.

@testset "Supercell volumes" begin
@testset "fcc" begin
    Vfcc = abs(det(cellfcc))
    @test abs(det(fcc1*cellfcc))/Vfcc   ≈ 1.0
    @test abs(det(fcc4*cellfcc))/Vfcc   ≈ 4.0
    @test abs(det(fcc7*cellfcc))/Vfcc   ≈ 7.0
    @test abs(det(fcc13*cellfcc))/Vfcc  ≈ 13.0
    @test abs(det(fcc23*cellfcc))/Vfcc  ≈ 23.0
    @test abs(det(fcc26*cellfcc))/Vfcc  ≈ 26.0
    @test abs(det(fcc32*cellfcc))/Vfcc  ≈ 32.0
    @test abs(det(fcc38*cellfcc))/Vfcc  ≈ 38.0
    @test abs(det(fcc50*cellfcc))/Vfcc  ≈ 50.0
    @test abs(det(fcc70*cellfcc))/Vfcc  ≈ 70.0
    @test abs(det(fcc92*cellfcc))/Vfcc  ≈ 92.0
    @test abs(det(fcc96*cellfcc))/Vfcc  ≈ 96.0
    @test abs(det(fcc100*cellfcc))/Vfcc ≈ 100.0
    @test abs(det(fcc108*cellfcc))/Vfcc ≈ 108.0
end;
@testset "cubic" begin
    Vcubic = abs(det(cellcubic))
    @test abs(det(cubic1*cellcubic))/Vcubic   ≈ 1.0
    @test abs(det(cubic3*cellcubic))/Vcubic   ≈ 3.0
    @test abs(det(cubic7*cellcubic))/Vcubic   ≈ 7.0
    @test abs(det(cubic8*cellcubic))/Vcubic   ≈ 8.0
    @test abs(det(cubic13*cellcubic))/Vcubic  ≈ 13.0
    @test abs(det(cubic14*cellcubic))/Vcubic  ≈ 14.0
    @test abs(det(cubic24*cellcubic))/Vcubic  ≈ 24.0
    @test abs(det(cubic27*cellcubic))/Vcubic  ≈ 27.0
    @test abs(det(cubic33*cellcubic))/Vcubic  ≈ 33.0
    @test abs(det(cubic38*cellcubic))/Vcubic  ≈ 38.0
    @test abs(det(cubic52*cellcubic))/Vcubic  ≈ 52.0
    @test abs(det(cubic56*cellcubic))/Vcubic  ≈ 56.0
    @test abs(det(cubic64*cellcubic))/Vcubic  ≈ 64.0
    @test abs(det(cubic73*cellcubic))/Vcubic  ≈ 73.0
    @test abs(det(cubic76*cellcubic))/Vcubic  ≈ 76.0
    @test abs(det(cubic93*cellcubic))/Vcubic  ≈ 93.0
    @test abs(det(cubic100*cellcubic))/Vcubic ≈ 100.0

end;
@testset "bcc" begin
    Vbcc = abs(det(cellbcc))
    @test abs(det(bcc1*cellbcc))/Vbcc   ≈ 1.0
    @test abs(det(bcc2*cellbcc))/Vbcc   ≈ 2.0
    @test abs(det(bcc6*cellbcc))/Vbcc   ≈ 6.0
    @test abs(det(bcc9*cellbcc))/Vbcc   ≈ 9.0
    @test abs(det(bcc16*cellbcc))/Vbcc  ≈ 16.0
    @test abs(det(bcc21*cellbcc))/Vbcc  ≈ 21.0
    @test abs(det(bcc25*cellbcc))/Vbcc  ≈ 25.0
    @test abs(det(bcc28*cellbcc))/Vbcc  ≈ 28.0
    @test abs(det(bcc35*cellbcc))/Vbcc  ≈ 35.0
    @test abs(det(bcc48*cellbcc))/Vbcc  ≈ 48.0
    @test abs(det(bcc53*cellbcc))/Vbcc  ≈ 53.0
    @test abs(det(bcc54*cellbcc))/Vbcc  ≈ 54.0
    @test abs(det(bcc65*cellbcc))/Vbcc  ≈ 65.0
    @test abs(det(bcc84*cellbcc))/Vbcc  ≈ 84.0
    @test abs(det(bcc91*cellbcc))/Vbcc  ≈ 91.0
    @test abs(det(bcc103*cellbcc))/Vbcc ≈ 103.0
    @test abs(det(bcc107*cellbcc))/Vbcc ≈ 107.0
    @test abs(det(bcc112*cellbcc))/Vbcc ≈ 112.0
    @test abs(det(bcc128*cellbcc))/Vbcc ≈ 128.0
end;
@testset "hcp" begin
    Vhcp = abs(det(cellhcp))
    @test abs(det(hcp1*cellhcp))/Vhcp   ≈ 1.0
    @test abs(det(hcp3*cellhcp))/Vhcp   ≈ 3.0
    @test abs(det(hcp6*cellhcp))/Vhcp   ≈ 6.0
    @test abs(det(hcp8*cellhcp))/Vhcp   ≈ 8.0
    @test abs(det(hcp11*cellhcp))/Vhcp  ≈ 11.0
    @test abs(det(hcp14*cellhcp))/Vhcp  ≈ 14.0
    @test abs(det(hcp16*cellhcp))/Vhcp  ≈ 16.0
    @test abs(det(hcp21*cellhcp))/Vhcp  ≈ 21.0
    @test abs(det(hcp27*cellhcp))/Vhcp  ≈ 27.0
    @test abs(det(hcp37*cellhcp))/Vhcp  ≈ 37.0
    @test abs(det(hcp39*cellhcp))/Vhcp  ≈ 39.0
    @test abs(det(hcp42*cellhcp))/Vhcp  ≈ 42.0
    @test abs(det(hcp53*cellhcp))/Vhcp  ≈ 53.0
    @test abs(det(hcp62*cellhcp))/Vhcp  ≈ 62.0
    @test abs(det(hcp65*cellhcp))/Vhcp  ≈ 65.0
    @test abs(det(hcp69*cellhcp))/Vhcp  ≈ 69.0
    @test abs(det(hcp76*cellhcp))/Vhcp  ≈ 76.0
    @test abs(det(hcp80*cellhcp))/Vhcp  ≈ 80.0
    @test abs(det(hcp88*cellhcp))/Vhcp  ≈ 88.0
    @test abs(det(hcp90*cellhcp))/Vhcp  ≈ 90.0
    @test abs(det(hcp100*cellhcp))/Vhcp ≈ 100.0
end;
end;
