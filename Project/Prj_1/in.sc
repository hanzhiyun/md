# bulk Silicon lattice
units            metal
boundary         p p p

atom_style       atomic

variable         x index 2.596 2.597 2.598 2.599 2.600 2.601 2.602 2.603 2.604

#lattice          diamond $x
#lattice         diamond 5.431
#lattice          fcc 3.615
#lattice         bcc 3.28
lattice          sc 2.60

region           box block 0 3 0 3 0 3
create_box       1 box
create_atoms     1 box

pair_style       sw
pair_coeff       * * Si.sw Si
mass             1 28
neighbor         1.0 bin
neighbor         1.0 bin
neigh_modify     every 1 delay 5 check yes

variable         P equal pe/27
variable         r equal 27/($x*3)^3
timestep         0.005
thermo           10

min_style        sd
minimize         1.0e-12 1.0e-12 1000 1000

compute          3 all pe/atom
compute          4 all ke/atom
compute          5 all coord/atom 3.0
dump             1 all custom 1 atom.lammpstrj id xs ys zs c_3 c_4 c_5
print            "@@@@ (lattice parameter, rho, energy per atom):  $x $r $P"

clear
next             x
jump             in.sc

