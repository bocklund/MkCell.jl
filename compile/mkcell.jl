
module mkcell
using MkCell

function parse_args(args)
    # 11 elements, whitespace separated
    # 9 for 3x3 matrix, [a b c; d e f; h i j]
    mat = reshape(parse.(Float64, args[1:9]), (3,3))'
    # scaling size
    scale = parse(Int, args[10])
    # search limits (can set automatically)
    lims = parse(Int, args[11])

    return mat, scale, lims

end

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    mat, scale, lims = parse_args(ARGS)
    @show MkCell.cellopt(mat, scale, lims)
    return 0
end

end
