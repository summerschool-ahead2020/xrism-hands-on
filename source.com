# define model
com cie
com red
com hot
# relate components
com rel 1 2,3
# distance
dist 1.e-2 z
# setup component 1
par 1 t v 2.

## important ##
## to convert unit from SPEX (photon s-1 m-2 kev-1) to HEASIM (photon s-1 cm-2 kev-1)
## divide normalization by a factor of 1e4

par 1 norm v 1.e4
# setup component 2
par 2 z v 1.e-2
# setup component 3
par 3 nh v 1.e-3
par 3 t v 1.e-6
# setup egrid 
eg lin 0.1:27.1 step 0.001 kev
# new atomic data
va ca ne
# qdp out
plot de null
plot ty mo
plot uy k
plot ux k 
plot x lin
plot y lin
calc
plot ad count over
quit
