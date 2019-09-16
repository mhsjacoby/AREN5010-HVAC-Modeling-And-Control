model LTM_tempflow
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Pulse T_int(amplitude = -30, offset = 273.15 +20, period = 60 * 60 * 17, startTime = 60 * 60 * 2, width = 40)  annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine T_ext(amplitude = 20, freqHz = 1 / (16 * 3600), offset = 273.15)  annotation(
    Placement(visible = true, transformation(origin = {-70, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.LowThermalMassWall_maggie LTM(T_start = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {-14, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.SawTooth q_int(amplitude = 25, offset = 273.15, period = 60 * 60 * 12, startTime = 3 * 60)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Cosine q_ext(amplitude = 20, freqHz = 1 / (60 * 60 * 26), offset = 273.15)  annotation(
    Placement(visible = true, transformation(origin = {-70, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(q_ext.y, LTM.q_ext) annotation(
    Line(points = {{-58, -6}, {-48, -6}, {-48, 10}, {-26, 10}, {-26, 10}}, color = {0, 0, 127}));
  connect(q_int.y, LTM.q_int) annotation(
    Line(points = {{-58, 30}, {-48, 30}, {-48, 16}, {-26, 16}, {-26, 16}}, color = {0, 0, 127}));
  connect(LTM.T_ext, T_ext.y) annotation(
    Line(points = {{-30, 4}, {-40, 4}, {-40, -42}, {-58, -42}, {-58, -42}}, color = {0, 0, 127}));
  connect(LTM.T_int, T_int.y) annotation(
    Line(points = {{-28, 20}, {-40, 20}, {-40, 70}, {-58, 70}, {-58, 70}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 86.4));end LTM_tempflow;