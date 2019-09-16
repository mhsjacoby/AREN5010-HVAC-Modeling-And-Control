model LightWallTestScenario
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant q_int(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant q_ext(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LightWallTest LWT  annotation(
    Placement(visible = true, transformation(origin = {2.66454e-15, 10}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Sources.Pulse T_int_setback(amplitude = -5, offset = 273.15 +20, period = 3600 * 24, startTime = 6 * 3600, width = 40)  annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine T_ext_sin(amplitude = 10, freqHz = 1 / (24 * 3600), offset = 273.15, phase = 3.14159)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(LWT.T_ext, T_ext_sin.y) annotation(
    Line(points = {{-17, 13}, {-41, 13}, {-41, 30}, {-59, 30}}, color = {0, 0, 127}));
  connect(LWT.T_int, T_int_setback.y) annotation(
    Line(points = {{-17, 18}, {-30, 18}, {-30, 70}, {-59, 70}}, color = {0, 0, 127}));
  connect(LWT.q_int, q_int.y) annotation(
    Line(points = {{-17, 2}, {-30, 2}, {-30, -50}, {-58, -50}}, color = {0, 0, 127}));
  connect(LWT.q_ext, q_ext.y) annotation(
    Line(points = {{-17, 7}, {-41, 7}, {-41, -10}, {-59, -10}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 86.4));end LightWallTestScenario;