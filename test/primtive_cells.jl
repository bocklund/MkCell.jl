# Primitive cells used for testing

# in all cases, a=1
cellcubic = [1.0 0 0; 0 1.0 0; 0 0 1.0];
cellfcc = [0 0.5 0.5; 0.5 0 0.5; 0.5 0.5 0];
#cellbcc = [-0.5 0.5 0.5; 0.5 -0.5 0.5; 0.5 0.5 -0.5];
cellhcp = [0.5 -√(3.0)/2 0; 0.5 √(3.0)/2 0; 0 0 √(8.0/3.0)];  # ideal c/a ratio, √(8/3)
# Through some trial and error testing, I determed that the "bcc" cell used in Table 3 of Militzer must have contained a typo. The real bcc cell was not working (table values did not match up). After seeing other cells work and scouring the code, I could not find the answer. Finally, I checked an invalid primitive cell and I think I found the issue. All the numbers (rmax, dmin, cell angles...) match up when the basis vectors are created with one basis vector missing a negative sign for one. This creates an primitive cell that has atoms overlapping when the basis vectors are translated in space, but it's technically still a valid primitive cell and can be used to check the algorithm's correctness.
cellbcc = [0.5 0.5 0.5; 0.5 -0.5 0.5; 0.5 0.5 -0.5];


# cellcubic = [1.0 0 0; 0 1.0 0; 0 0 1.0];
# cellfcc = [-0.5 0 0.5; 0 0.5 0.5; -0.5 0.5 0];
# cellbcc = [0.5 0.5 0.5; -0.5 0.5 0.5; -0.5 -0.5 0.5];
# hcp_ca = √(8.0/3.0)  # ideal c/a ratio
# cellhcp = [1 0 0; -1/2 √(3.0)/2 0; 0 0 hcp_ca];
