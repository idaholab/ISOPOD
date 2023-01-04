
[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 10
  ny = 20
  xmax = 1
  ymax = 2
[]

[Variables]
  [adjointVar]
  []
[]

[Kernels]
  [heat_conduction]
    type = MatDiffusion
    variable = adjointVar
    diffusivity = thermal_conductivity
  []
[]

#-----every adjoint problem should have these two
[DiracKernels]
  [pt]
    type = ReporterPointSource
    variable = adjointVar
    x_coord_name = misfit/measurement_xcoord
    y_coord_name = misfit/measurement_ycoord
    z_coord_name = misfit/measurement_zcoord
    value_name = misfit/misfit_values
  []
[]

[Reporters]
  [misfit]
    type=OptimizationData
  []
[]
#---------------------------------------------------

[BCs]
  [left]
    type = NeumannBC
    variable = adjointVar
    boundary = left
    value = 0
  []
  [right]
    type = DirichletBC
    variable = adjointVar
    boundary = right
    value = 0
  []
  [bottom]
    type = DirichletBC
    variable = adjointVar
    boundary = bottom
    value = 0
  []
  [top]
    type = DirichletBC
    variable = adjointVar
    boundary = top
    value = 0
  []
[]

[Materials]
  [steel]
    type = GenericConstantMaterial
    prop_names = thermal_conductivity
    prop_values = 5
  []
[]

[Executioner]
  type = Steady
  solve_type = NEWTON
  nl_abs_tol = 1e-6
  nl_rel_tol = 1e-8
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
[]

[VectorPostprocessors]
  [gradient]
    type = PointValueSampler
    points = '0.2 0.2 0
              0.2 0.8 0
              0.8 0.2 0'
    variable = adjointVar
    sort_by = id
  []
[]

[Outputs]
  console = false
  exodus = false
  file_base = 'adjoint'
[]
