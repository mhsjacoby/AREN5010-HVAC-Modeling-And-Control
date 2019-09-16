model LightWallTest
  extends RCNetworks.BaseClasses.PartialWallIcon;
  RCNetworks.RCElements.Resistance A0(R = 0.059)  annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.RCElements.Layer A2(C = 0.92 * 203.5 * {1 / 2, 1 / 2} * 1000, R = 0.076 * {1 / 3, 1 / 3, 1 / 3}, T_start = 293.15, n = 2, use_externalQ = true)  annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 12}}, rotation = 0)));
  RCNetworks.RCElements.Resistance E0(R = 0.121)  annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T_ext annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T_int annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput q_ext annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  RCNetworks.Sources.PrescribedTemperature temReaCon_int annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RCNetworks.Sources.PrescribedTemperature temReaCon_ext annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senT_ext annotation(
    Placement(visible = true, transformation(origin = {85, 41}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senT_int annotation(
    Placement(visible = true, transformation(origin = {84, 4.44089e-16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Ts_ext "Exterior surface temperature" annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Ts_int "Interior surface temperature" annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput q_int annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor sen_qs_ext annotation(
    Placement(visible = true, transformation(origin = {-14, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor sen_qs_int annotation(
    Placement(visible = true, transformation(origin = {54, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qs_ext "Interior surface heat flux" annotation(
    Placement(visible = true, transformation(origin = {110, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qs_int "Interior surface heat flux" annotation(
    Placement(visible = true, transformation(origin = {110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sen_qs_int.Q_flow, qs_int) annotation(
    Line(points = {{54, 10}, {54, -20}, {110, -20}}, color = {0, 0, 127}));
  connect(senT_int.T, Ts_int) annotation(
    Line(points = {{92, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(E0.port_b, sen_qs_int.port_b) annotation(
    Line(points = {{40, 60}, {70, 60}, {70, 20}, {64, 20}}, color = {191, 0, 0}));
  connect(A2.port_b, sen_qs_int.port_a) annotation(
    Line(points = {{40, 20}, {44, 20}}, color = {191, 0, 0}));
  connect(sen_qs_ext.Q_flow, qs_ext) annotation(
    Line(points = {{-14, 10}, {-14, -48}, {110, -48}}, color = {0, 0, 127}));
  connect(senT_int.port, E0.port_b) annotation(
    Line(points = {{76, 0}, {76, 35.5}, {54, 35.5}, {54, 59.875}, {40, 59.875}, {40, 60}}, color = {191, 0, 0}));
  connect(temReaCon_int.port, E0.port_a) annotation(
    Line(points = {{-60, 60}, {20, 60}}, color = {191, 0, 0}));
  connect(senT_ext.port, A2.port_a) annotation(
    Line(points = {{76, 41}, {8, 41}, {8, 20}, {20, 20}}, color = {191, 0, 0}));
  connect(senT_ext.T, Ts_ext) annotation(
    Line(points = {{94, 41}, {102, 41}, {102, 40}, {110, 40}}, color = {0, 0, 127}));
  connect(A2.q_int, q_int) annotation(
    Line(points = {{18, 12}, {12, 12}, {12, -60}, {-120, -60}}, color = {0, 0, 127}));
  connect(A2.q_ext, q_ext) annotation(
    Line(points = {{18, 17}, {7.5, 17}, {7.5, -20}, {-120, -20}}, color = {0, 0, 127}));
  connect(sen_qs_ext.port_b, A2.port_a) annotation(
    Line(points = {{-4, 20}, {20, 20}, {20, 20}, {20, 20}}, color = {191, 0, 0}));
  connect(A0.port_b, sen_qs_ext.port_a) annotation(
    Line(points = {{-30, 20}, {-24, 20}, {-24, 20}, {-24, 20}}, color = {191, 0, 0}));
  connect(temReaCon_ext.port, A0.port_a) annotation(
    Line(points = {{-60, 20}, {-50, 20}}, color = {191, 0, 0}));
  connect(temReaCon_ext.T, T_ext) annotation(
    Line(points = {{-82, 20}, {-120, 20}}, color = {0, 0, 127}));
  connect(temReaCon_int.T, T_int) annotation(
    Line(points = {{-82, 60}, {-112, 60}, {-112, 60}, {-120, 60}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 864000, Tolerance = 1e-6, Interval = 864));end LightWallTest;