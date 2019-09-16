model LTM_externa_onlyl
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant q_int(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine T_ext(amplitude = 10, freqHz = 1 / (24 * 3600), offset = 273.15, phase = 3.31613)  annotation(
    Placement(visible = true, transformation(origin = {-70, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine q_ext(amplitude = 15, freqHz = 1 / (24 * 3600), offset = 273.15, phase = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {-70, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid T_int(amplitude = 5, falling = 3600 * .75, offset = 273 + 20, period = 3600 * 24, rising = 3600 * .75, startTime = 3600 * 5, width = 3600 * 6)  annotation(
    Placement(visible = true, transformation(origin = {-68, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.LowThermalMassWall_maggie LTM(T_start = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {-2, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(LTM.T_ext, T_ext.y) annotation(
    Line(points = {{-18, 2}, {-46, 2}, {-46, -42}, {-58, -42}, {-58, -42}}, color = {0, 0, 127}));
  connect(LTM.q_ext, q_ext.y) annotation(
    Line(points = {{-14, 8}, {-54, 8}, {-54, -4}, {-58, -4}, {-58, -4}}, color = {0, 0, 127}));
  connect(LTM.q_int, q_int.y) annotation(
    Line(points = {{-14, 14}, {-18, 14}, {-18, 10}, {-54, 10}, {-54, 32}, {-58, 32}, {-58, 32}}, color = {0, 0, 127}));
  connect(LTM.T_int, T_int.y) annotation(
    Line(points = {{-16, 18}, {-44, 18}, {-44, 74}, {-56, 74}, {-56, 74}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 86.4));end LTM_externa_onlyl;