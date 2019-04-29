using PackageCompiler

modulepth  = "compile/mkcell.jl"
testpth    = "test/runtests.jl"
builddir   = "_build"

build_executable(modulepth, snoopfile=testpth, builddir=builddir)
