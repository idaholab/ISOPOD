[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 2
    nx = 100
    ny = 100
    xmax = 1
    ymax = 1
  []
[]

[Variables]
  [temperature]
  []
[]

[Kernels]
  [heat_conduction]
    type = ADHeatConduction
    variable = temperature
  []
[]

[DiracKernels]
  [ar]
    type = ReporterPointSource
    variable = temperature
    x_coord_name = point_source/x
    y_coord_name = point_source/y
    z_coord_name = point_source/z
    value_name = point_source/value
  []
[]

[BCs]
  [left]
    type = DirichletBC
    variable = temperature
    boundary = left
    value = 0
  []
  [right]
    type = DirichletBC
    variable = temperature
    boundary = right
    value = 0
  []
  [bottom]
    type = DirichletBC
    variable = temperature
    boundary = bottom
    value = 0
  []
  [top]
    type = DirichletBC
    variable = temperature
    boundary = top
    value = 0
  []
[]

[Materials]
  [steel]
    type = ADGenericConstantMaterial
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

[Reporters]
  [measure_data]
    type = OptimizationData
    variable = temperature
  []
[]


[VectorPostprocessors]
  [point_source]
    type = ConstantVectorPostprocessor
    vector_names = 'x y z value'
    value = '0.3 0.3 0.3 0.3 0.7 0.7 0.7 0.7;
             0.8 0.6 0.4 0.2 0.8 0.6 0.4 0.2;
             0   0   0   0   0   0   0   0;
             0   0   0   0   0   0   0   0'
    execute_on = LINEAR
  []
[]

[Outputs]
  console = false
  exodus = false
  file_base = 'forward'
[]
