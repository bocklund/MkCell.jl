# Lattices from B. Militzer, High Energy Density Phys. 21 (2016) 8–15. doi:10.1016/j.hedp.2016.09.003. Tables 1-4

fcc1 = [1 0 0; 1 -1 0; 0 0 -1];
fcc4 = [1 1 -1 ; 1 -1 1; 1 -1 -1];
fcc7 = [1 1 0; -1 2 -1; -1 0 2];
fcc13 = [2 1 -1; 2 -1 -2; -1 1 -2];
fcc23 = [3 -1 0; -1 3 -1; -1 0 3];
fcc32 = [2 2 -2; 2 -2 2; 2 -2 -2];

cubic1 = [1 0 0; 0 1 0; 0 0 -1];
cubic3 = [1 0 1; 1 1 0; 1 -1 -1];
cubic7 = [2 0 1; 1 2 0; 1 -1 -1];
cubic13 = [2 1 1; 1 -2 -1; 0 -1 2];
cubic24 = [3 0 0; 0 2 2; 0 2 -2];
cubic27 = [3 0 0; 0 3 0; 0 0 -3];

bcc1 = [1 0 0; -1 -1 -1; 0 -1 0]; # paper seems to have a typo, was [1 0 0; 1 -1 -1; 0 -1 0]
bcc2 = [1 0 -1; 1 -1 0; 0 -1 -1];
bcc6 = [2 -1 -2; -1 2 1; -1 0 -1];
bcc16 = [2 0 2; 2 2 0; 0 2 2];  # another typo: [2 0 -2; 2 -2 0; 0 -2 -2]
bcc25 = [3 -1 -3; -2 3 1; -1 -1 -2];
bcc48 = [3 0 -3; 2 -4 -2; -2 0 -2];

hcp1 = [1 0 0; 1 1 0; 0 0 1];
hcp3 = [2 1 0; 1 -1 0; 0 0 -1];
hcp6 = [2 2 1; 1 1 -1; -1 1 0];
hcp11 = [3 1 0; 1 2 1; 0 -2 1];
hcp14 = [2 -1 1; -2 -2 1; 0 -2 -1];
hcp80 = [5 0 0; 2 4 2; 2 4 -2];