model HTM_allflow
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Pulse T_int(amplitude = -30, offset = 273.15 +20, period = 60 * 60 * 17, startTime = 60 * 60 * 2, width = 40)  annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine T_ext(amplitude = 20, freqHz = 1 / (16 * 3600), offset = 273.15)  annotation(
    Placement(visible = true, transformation(origin = {-70, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.SawTooth q_int(amplitude = 25, offset = 273.15, period = 60 * 60 * 12, startTime = 3 * 60)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Cosine q_ext(amplitude = 20, freqHz = 1 / (60 * 60 * 26), offset = 273.15)  annotation(
    Placement(visible = true, transformation(origin = {-70, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.HighThermalMassWall_maggie HTM annotation(
    Placement(visible = true, transformation(origin = {2, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T_ext.y, HTM.T_ext) annotation(
    Line(points = {{-58, -42}, {-32, -42}, {-32, 6}, {-14, 6}, {-14, 6}}, color = {0, 0, 127}));
  connect(q_ext.y, HTM.q_ext) annotation(
    Line(points = {{-58, -6}, {-44, -6}, {-44, 12}, {-10, 12}, {-10, 12}}, color = {0, 0, 127}));
  connect(q_int.y, HTM.q_int) annotation(
    Line(points = {{-58, 30}, {-44, 30}, {-44, 18}, {-10, 18}, {-10, 18}}, color = {0, 0, 127}));
  connect(T_int.y, HTM.T_int) annotation(
    Line(points = {{-58, 70}, {-34, 70}, {-34, 22}, {-12, 22}, {-12, 22}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 86.4));end HTM_allflow;