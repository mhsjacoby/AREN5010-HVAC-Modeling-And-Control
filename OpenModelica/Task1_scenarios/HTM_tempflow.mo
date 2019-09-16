model HTM_tempflow
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant q_int(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant T_int(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine T_ext(amplitude = 10, freqHz = 1 / (24 * 3600), offset = 273.15, phase = 3.14159)  annotation(
    Placement(visible = true, transformation(origin = {-70, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.HighThermalMassWall_maggie HTM(T_start = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {2, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine q_ext(amplitude = 15, freqHz = 1 / (24 * 3600), offset = 273.15, phase = 2.0944) annotation(
    Placement(visible = true, transformation(origin = {-70, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(HTM.q_ext, q_ext.y) annotation(
    Line(points = {{-10, 14}, {-54, 14}, {-54, -4}, {-58, -4}, {-58, -4}}, color = {0, 0, 127}));
  connect(HTM.T_int, T_int.y) annotation(
    Line(points = {{-12, 24}, {-42, 24}, {-42, 70}, {-58, 70}, {-58, 70}}, color = {0, 0, 127}));
  connect(HTM.T_ext, T_ext.y) annotation(
    Line(points = {{-10, 8}, {-46, 8}, {-46, -42}, {-60, -42}, {-60, -42}, {-58, -42}}, color = {0, 0, 127}));
  connect(HTM.q_int, q_int.y) annotation(
    Line(points = {{-10, 20}, {-48, 20}, {-48, 32}, {-72, 32}, {-72, 32}, {-58, 32}, {-58, 32}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 86.4));end HTM_tempflow;