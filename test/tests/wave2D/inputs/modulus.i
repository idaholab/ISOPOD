[Reporters]
  [parameters]
    type = ConstantReporter
    real_vector_names = 'coordx coordy Gr'
    real_vector_values = '-7 7 0; -7 7 0; 8 24 5'
  []
[]

[Functions]
  [Gr_func]
    type = NearestReporterCoordinatesFunction
    x_coord_name = parameters/coordx
    y_coord_name = parameters/coordy
    value_name   = parameters/Gr
  []
  [Er_dist]
    type = ParsedFunction
    # expression = 'if((x^2+y^2) < 5^2, 80,25)'
    # expression = '25'
    expression = 2*(1+${nu})*Gr
    symbol_names = 'Gr'
    symbol_values = 'Gr_func'
  []
  [Ei_dist]
    type = ParsedFunction
    expression = Er_dist*${omega}/${omega_bar}
    symbol_names = 'Er_dist'
    symbol_values = 'Er_dist'
  []
  [_Ei_dist]
    type = ParsedFunction
    expression = -Ei_dist
    symbol_names = 'Ei_dist'
    symbol_values = 'Ei_dist'
  []
[]