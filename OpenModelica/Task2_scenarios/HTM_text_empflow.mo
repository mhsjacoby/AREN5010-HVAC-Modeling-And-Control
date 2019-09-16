model HTM_tempflow
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant q_int(k = 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant T_int(k = 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine T_ext(amplitude = -10, freqHz = 1 / (24 * 3600), offset = 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 273.15) annotation(
    Placement(visible = true, transformation(origin = {-70, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.HighThermalMassWall_maggie HTM annotation(
    Placement(visible = true, transformation(origin = {-2, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T_ext.y, HTM.T_ext) annotation(
    Line(points = {{-58, -42}, {-28, -42}, {-28, 8}, {-18, 8}, {-18, 8}}, color = {0, 0, 127}));
  connect(const.y, HTM.q_ext) annotation(
    Line(points = {{-58, -6}, {-40, -6}, {-40, 14}, {-14, 14}, {-14, 14}}, color = {0, 0, 127}));
  connect(q_int.y, HTM.q_int) annotation(
    Line(points = {{-58, 32}, {-42, 32}, {-42, 20}, {-14, 20}, {-14, 20}}, color = {0, 0, 127}));
  connect(T_int.y, HTM.T_int) annotation(
    Line(points = {{-58, 70}, {-34, 70}, {-34, 24}, {-16, 24}, {-16, 24}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 86400, Tolerance = 1e-6, Interval = 86.4));
end HTM_tempflow;