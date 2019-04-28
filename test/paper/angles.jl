@testset "Angles" begin
@testset "fcc" begin
    @test all(MkCell.cell_angles(fcc1*cellfcc)   .≈ (90.0, 120.0, 60.0))
    @test all(MkCell.cell_angles(fcc4*cellfcc)   .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(fcc7*cellfcc)   .≈ (99.59406822686046, 80.40593177313954, 80.40593177313954))
    @test all(MkCell.cell_angles(fcc13*cellfcc)  .≈ (72.54239687627792, 107.4576031237221, 72.54239687627792))
    @test all(MkCell.cell_angles(fcc23*cellfcc)  .≈ (90.0, 85.90395624184767, 107.9752838098089))
    @test all(MkCell.cell_angles(fcc26*cellfcc)  .≈ (85.90395624184767, 94.09604375815232, 94.09604375815232))
    @test all(MkCell.cell_angles(fcc32*cellfcc)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(fcc38*cellfcc)  .≈ (93.1847385367204, 86.8152614632796, 86.8152614632796))
    @test all(MkCell.cell_angles(fcc50*cellfcc)  .≈ (97.83747976308429, 82.16252023691571, 82.16252023691571))
    @test all(MkCell.cell_angles(fcc70*cellfcc)  .≈ (90.0, 87.79577249602796, 79.68680947509941))
    @test all(MkCell.cell_angles(fcc92*cellfcc)  .≈ (88.30279727450392, 88.08978682829007, 95.09758601873176))
    @test all(MkCell.cell_angles(fcc96*cellfcc)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(fcc100*cellfcc) .≈ (93.2771683126184, 86.7228316873816, 79.83575137827653))
    @test all(MkCell.cell_angles(fcc108*cellfcc) .≈ (90.0, 90.0, 90.0))
end;
@testset "cubic" begin
    @test all(MkCell.cell_angles(cubic1*cellcubic)   .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(cubic3*cellcubic)   .≈ (90.0, 90.0, 60.00000000000001))
    @test all(MkCell.cell_angles(cubic7*cellcubic)   .≈ (104.96321743330712, 75.03678256669288, 66.42182152179818))
    @test all(MkCell.cell_angles(cubic8*cellcubic)   .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(cubic13*cellcubic)  .≈ (90.0, 79.48026510934139, 99.59406822686046))
    @test all(MkCell.cell_angles(cubic14*cellcubic)  .≈ (99.59406822686046, 99.59406822686046, 99.59406822686046))
    @test all(MkCell.cell_angles(cubic24*cellcubic)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(cubic27*cellcubic)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(cubic33*cellcubic)  .≈ (90.0, 95.73917047726677, 90.0))
    @test all(MkCell.cell_angles(cubic38*cellcubic)  .≈ (85.20308428929593, 95.21590857045413, 75.47084566659821))
    @test all(MkCell.cell_angles(cubic52*cellcubic)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(cubic56*cellcubic)  .≈ (97.44883282786358, 98.21321070173819, 97.44883282786358))
    @test all(MkCell.cell_angles(cubic64*cellcubic)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(cubic73*cellcubic)  .≈ (90.0, 80.12503860217872, 93.1847385367204))
    @test all(MkCell.cell_angles(cubic76*cellcubic)  .≈ (93.1847385367204, 93.1847385367204, 93.1847385367204))
    @test all(MkCell.cell_angles(cubic93*cellcubic)  .≈ (92.666603476751, 92.86957619589583, 95.61383424102878))
    @test all(MkCell.cell_angles(cubic100*cellcubic) .≈ (90.0, 90.0, 90.0))
end;
@testset "bcc" begin
    @test all(MkCell.cell_angles(bcc1*cellbcc)   .≈ (70.52877936550931, 109.47122063449069, 70.52877936550931))
    @test all(MkCell.cell_angles(bcc2*cellbcc)   .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(bcc6*cellbcc)   .≈ (90.0, 90.0, 115.2394018206789))
    @test all(MkCell.cell_angles(bcc9*cellbcc)   .≈ (84.78409142954588, 95.21590857045413, 84.78409142954588))
    @test all(MkCell.cell_angles(bcc16*cellbcc)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(bcc21*cellbcc)  .≈ (86.98303869018402, 95.88878512679155, 95.88878512679155))
    @test all(MkCell.cell_angles(bcc25*cellbcc)  .≈ (90.0, 85.06265611930155, 104.96321743330712))
    @test all(MkCell.cell_angles(bcc28*cellbcc)  .≈ (80.40593177313954, 99.59406822686046, 80.40593177313954))
    @test all(MkCell.cell_angles(bcc35*cellbcc)  .≈ (87.87744863785665, 92.12255136214335, 87.87744863785665))
    @test all(MkCell.cell_angles(bcc48*cellbcc)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(bcc53*cellbcc)  .≈ (96.05074601591176, 83.86309610848119, 73.63722782068534))
    @test all(MkCell.cell_angles(bcc54*cellbcc)  .≈ (90.0, 90.0, 90.0))
    @test all(MkCell.cell_angles(bcc65*cellbcc)  .≈ (77.91853011529311, 102.08146988470688, 77.91853011529311))
    @test all(MkCell.cell_angles(bcc84*cellbcc)  .≈ (92.24963404707006, 87.75036595292995, 84.78409142954588))
    @test all(MkCell.cell_angles(bcc91*cellbcc)  .≈ (88.87648134229958, 91.12351865770042, 88.87648134229958))
    @test all(MkCell.cell_angles(bcc103*cellbcc) .≈ (92.06928050584378, 93.99037534653964, 94.25094462500175))
    @test all(MkCell.cell_angles(bcc107*cellbcc) .≈ (90.0, 94.09604375815232, 86.00962465346038))
    @test all(MkCell.cell_angles(bcc112*cellbcc) .≈ (94.86140539579802, 85.13859460420197, 85.13859460420197))
    @test all(MkCell.cell_angles(bcc128*cellbcc) .≈ (90.0, 90.0, 90.0))
end;
@testset "hcp" begin
    @test all(MkCell.cell_angles(hcp1*cellhcp) .≈ (90, 90, 60))
    @test all(MkCell.cell_angles(hcp3*cellhcp) .≈ (90, 90, 60))
    @test all(MkCell.cell_angles(hcp6*cellhcp) .≈(90, 90, 97.7493663782984))
    # @test all(MkCell.cell_angles(hcp11*cellhcp) .≈
    # @test all(MkCell.cell_angles(hcp14*cellhcp) .≈
    # @test all(MkCell.cell_angles(hcp80*cellhcp) .≈
end;

end;