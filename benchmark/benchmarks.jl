using BenchmarkTools, MkCell

cellfcc = [-0.5 0 0.5; 0 0.5 0.5; -0.5 0.5 0];
cellcubic = [1.0 0 0; 0 1.0 0; 0 0 1.0];

const suite = BenchmarkGroup()

suite["integration"] = BenchmarkGroup()
suite["integration"]["fcc1"] = @benchmarkable MkCell.cellopt($cellfcc, 1, 2)
suite["integration"]["cubic3"] = @benchmarkable MkCell.cellopt($cellcubic, 3, 2)

# If a cache of tuned parameters already exists, use it, otherwise, tune and cache
# the benchmark parameters. Reusing cached parameters is faster and more reliable
# than re-tuning `suite` every time the file is included.
paramspath = joinpath(dirname(@__FILE__), "params.json")
if isfile(paramspath)
loadparams!(suite, BenchmarkTools.load(paramspath)[1], :evals);
else
tune!(suite)
    BenchmarkTools.save(paramspath, params(suite));
end

# run the suite
println("Warming up")
warmup(suite, verbose=false)
println("Running")
bmrun = run(suite)
println("fcc1 integration:")
display(bmrun["integration"]["fcc1"])
println()
println("cubic3 integration: ")
display(bmrun["integration"]["cubic3"])
println()
