

# Developing

1. Start julia (in the projects directory)
2. pkg> develop MkCell
3. using Revise
4. using MkCell

# Running tests
1. pkg> test MkCell

# Adding packages to the dependencies
1. pkg> activate MkCell
2. pkg> add DEPENDENTPKG
3. pkg> resolve

# Compiling

1. make build
2. make install PREFIX=~/bin
