model HTM_heatflow
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant T_int(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant T_ext(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-68, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse q_int(amplitude = -5, offset = 273.15 +20, period = 3600 * 24, startTime = 6 * 3600, width = 40)  annotation(
    Placement(visible = true, transformation(origin = {-70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine q_ext(amplitude = 10, freqHz = 1 / (24 * 3600), offset = 273.15, phase = 3.14159)  annotation(
    Placement(visible = true, transformation(origin = {-70, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.HighThermalMassWall_maggie HTM_Maggie(T_start = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {2, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(HTM_Maggie.T_int, T_int.y) annotation(
    Line(points = {{-10, 24}, {-40, 24}, {-40, 68}, {-58, 68}, {-58, 68}}, color = {0, 0, 127}));
  connect(HTM_Maggie.q_int, q_int.y) annotation(
    Line(points = {{-10, 20}, {-50, 20}, {-50, 32}, {-58, 32}, {-58, 32}}, color = {0, 0, 127}));
  connect(HTM_Maggie.q_ext, q_ext.y) annotation(
    Line(points = {{-10, 14}, {-52, 14}, {-52, -12}, {-60, -12}, {-60, -12}, {-58, -12}}, color = {0, 0, 127}));
  connect(HTM_Maggie.T_ext, T_ext.y) annotation(
    Line(points = {{-10, 8}, {-46, 8}, {-46, -48}, {-56, -48}, {-56, -48}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 86.4));end HTM_heatflow;