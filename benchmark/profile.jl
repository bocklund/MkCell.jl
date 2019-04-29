# Profiling script

using MkCell

cellfcc = [-0.5 0 0.5; 0 0.5 0.5; -0.5 0.5 0];

MkCell.cellopt(cellfcc, 7, 2)

using Profile

Profile.clear_malloc_data()

# small benchmark
# MkCell.cellopt(cellfcc, 7, 2)

# large benchmark
MkCell.cellopt(cellfcc, 108, 5)
