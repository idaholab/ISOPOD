# The push needs to be modified
# must be frequency dependent

[DiracKernels]
  [push]
    type = ConstantPointSource
    point = ${ARF_location}
    variable = uzr
    value = 100
  []
[]

#[Kernels]
#  [push]
#    type = BodyForce
#    variable = uyr
#    value = 10
#    function = exp(-5*((x-3)^2+(y-3)^2))
#  []
#[]

