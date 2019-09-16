within RCNetworks;
model LowThermalMassWall_maggie
  extends RCNetworks.BaseClasses.PartialWallIcon;

  parameter Modelica.SIunits.Temperature T_start=273.15 + 20
    "Initial temperature of capacities";

  RCNetworks.RCElements.Resistance               A0(
    R=0.059)
    annotation (Placement(visible = true, transformation(extent = {{-54, -84}, {-34, -64}}, rotation = 0)));
  RCNetworks.RCElements.Layer A2(
    
    C={187.22} * 1000,R={0.076,0.076}/2,
    T_start=T_start,
    use_externalQ=true, use_internalQ = false)
    annotation (Placement(visible = true, transformation(extent = {{-86, -6}, {-66, 16}}, rotation = 0)));
  RCNetworks.RCElements.Layer X2(
    C={0.732} * 1000,
    R={0.810, 0.810}/2,
    T_start=T_start, use_externalQ = false, use_internalQ = false)
    annotation (Placement(visible = true, transformation(extent = {{-22, -6}, {-2, 16}}, rotation = 0)));
  RCNetworks.RCElements.Layer B4(
    C={7.109} * 1000,
    R={1.723, 1.723}/2,
    T_start=T_start, use_externalQ = false, use_internalQ = false)
    annotation (Placement(visible = true, transformation(extent = {{10, -6}, {30, 16}}, rotation = 0)));
  RCNetworks.RCElements.Layer E1(
    
    C={16.40} * 1000,
    R={0.017, 0.17},T_start=T_start, use_externalQ = false,
    use_internalQ= true) annotation (Placement(visible = true, transformation(extent = {{40, -6}, {60, 16}}, rotation = 0)));
  RCNetworks.RCElements.Resistance E0(R=0.121)
    annotation (Placement(visible = true, transformation(origin = {-42, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealInput T_int(final quantity="ThermodynamicTemperature",
      final displayUnit="degC") "Indoor temperature"
    annotation (Placement(visible = true, transformation(extent = {{-168, 60}, {-128, 100}}, rotation = 0), iconTransformation(extent = {{-168, 60}, {-128, 100}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealInput q_ext(final quantity="Power", final
      displayUnit="W") "Solar radiance"
    annotation (Placement(visible = true, transformation(extent = {{-140, -38}, {-100, 2}}, rotation = 0), iconTransformation(extent = {{-140, -38}, {-100, 2}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput q_int(final quantity="Power", final
      displayUnit="W") "Solar radiance"
    annotation (Placement(visible = true, transformation(extent = {{-140, 10}, {-100, 50}}, rotation = 0), iconTransformation(extent = {{-140, 10}, {-100, 50}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senT_ext
    "Exterior surface temperature sensor"
    annotation (Placement(visible = true, transformation(extent = {{58, -60}, {78, -40}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Ts_ext(
    final quantity="ThermodynamicTemperature",
    final displayUnit="degC")
   "Exterior surface temperature"
    annotation (Placement(visible = true, transformation(extent = {{108, -60}, {128, -40}}, rotation = 0), iconTransformation(extent = {{108, -60}, {128, -40}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senT_int
    "Exterior surface temperature sensor"
    annotation (Placement(visible = true, transformation(extent = {{74, 70}, {94, 90}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Ts_int(
    final quantity="ThermodynamicTemperature",
    final displayUnit="degC")
    "Interior surface temperature"
    annotation (Placement(visible = true, transformation(extent = {{140, 70}, {160, 90}}, rotation = 0), iconTransformation(extent = {{140, 70}, {160, 90}}, rotation = 0)));
  Sources.PrescribedTemperature temReaCon_int "Temperature connector "
    annotation (Placement(transformation(extent={{-92,70},{-72,90}})));
  RCNetworks.RCElements.Layer B7(C = {0.314} * 1000, R = {0.174, 0.174} / 2, T_start = T_start, use_externalQ = false, use_internalQ = false) annotation(
    Placement(visible = true, transformation(extent = {{-56, -6}, {-36, 16}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor_int annotation(
    Placement(visible = true, transformation(origin = {36, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor_ext annotation(
    Placement(visible = true, transformation(origin = {-16, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qs_int annotation(
    Placement(visible = true, transformation(origin = {122, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {122, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qs_ext annotation(
    Placement(visible = true, transformation(origin = {150, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {150, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.PrescribedTemperature temReaCon_ext annotation(
    Placement(visible = true, transformation(extent = {{-92, -84}, {-72, -64}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput T_ext annotation(
    Placement(visible = true, transformation(extent = {{-176, -92}, {-136, -52}}, rotation = 0), iconTransformation(extent = {{-176, -92}, {-136, -52}}, rotation = 0)));
equation
  connect(q_int, E1.q_int) annotation(
    Line(points = {{-120, 30}, {32, 30}, {32, -4}, {38, -4}, {38, -4}}, color = {0, 0, 127}));
  connect(A2.port_a, heatFlowSensor_ext.port_b) annotation(
    Line(points = {{-86, 4}, {-86, 4}, {-86, -34}, {6, -34}, {6, -50}, {-6, -50}, {-6, -50}}, color = {191, 0, 0}));
  connect(A2.port_a, senT_ext.port) annotation(
    Line(points = {{-86, 4}, {-94, 4}, {-94, -22}, {54, -22}, {54, -50}, {58, -50}, {58, -50}}, color = {191, 0, 0}));
  connect(E0.port_b, heatFlowSensor_int.port_b) annotation(
    Line(points = {{-32, 80}, {46, 80}, {46, 54}, {46, 54}}, color = {191, 0, 0}));
  connect(E1.port_b, senT_int.port) annotation(
    Line(points = {{60, 4}, {66, 4}, {66, 80}, {74, 80}, {74, 80}}, color = {191, 0, 0}));
  connect(E1.port_b, heatFlowSensor_int.port_a) annotation(
    Line(points = {{60, 4}, {66, 4}, {66, 36}, {16, 36}, {16, 54}, {26, 54}}, color = {191, 0, 0}));
  connect(T_ext, temReaCon_ext.T) annotation(
    Line(points = {{-156, -72}, {-104, -72}, {-104, -74}, {-94, -74}, {-94, -74}}, color = {0, 0, 127}));
  connect(T_int, temReaCon_int.T) annotation(
    Line(points = {{-148, 80}, {-94, 80}, {-94, 80}, {-94, 80}}, color = {0, 0, 127}));
  connect(q_ext, A2.q_ext) annotation(
    Line(points = {{-120, -18}, {-96, -18}, {-96, 2}, {-88, 2}, {-88, 0}}, color = {0, 0, 127}));
  connect(temReaCon_ext.port, A0.port_a) annotation(
    Line(points = {{-72, -74}, {-54, -74}}, color = {191, 0, 0}));
  connect(senT_int.T, Ts_int) annotation(
    Line(points = {{94, 80}, {150, 80}}, color = {0, 0, 127}));
  connect(heatFlowSensor_int.Q_flow, qs_int) annotation(
    Line(points = {{36, 44}, {78, 44}, {78, 18}, {122, 18}}, color = {0, 0, 127}));
  connect(senT_ext.T, Ts_ext) annotation(
    Line(points = {{78, -50}, {118, -50}}, color = {0, 0, 127}));
  connect(heatFlowSensor_ext.Q_flow, qs_ext) annotation(
    Line(points = {{-16, -60}, {-16, -60}, {-16, -82}, {150, -82}, {150, -82}}, color = {0, 0, 127}));
  connect(A0.port_b, heatFlowSensor_ext.port_a) annotation(
    Line(points = {{-34, -74}, {-34, -71}, {-26, -71}, {-26, -50}}, color = {191, 0, 0}));
  connect(B7.port_b, X2.port_a) annotation(
    Line(points = {{-36, 4}, {-22, 4}}, color = {191, 0, 0}));
  connect(A2.port_b, B7.port_a) annotation(
    Line(points = {{-66, 4}, {-56, 4}}, color = {191, 0, 0}));
  connect(B4.port_b, E1.port_a) annotation(
    Line(points = {{30, 4}, {40, 4}}, color = {191, 0, 0}));
  connect(X2.port_b, B4.port_a) annotation(
    Line(points = {{-2, 4}, {10, 4}}, color = {191, 0, 0}));
  connect(temReaCon_int.port, E0.port_a) annotation(
    Line(points = {{-72, 80}, {-52, 80}, {-52, 80}, {-52, 80}}, color = {191, 0, 0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
This is a RC model for a 7-layer high thermal mass wall. 
Each layer that has mass is modelled as (n+1)RnC.
The parameter <code>n</code> can be set by users. 
The defaulted <code>n</code> is set to 1, which means the defaulted layer is modeled as 2R1C.
</p>
</html>"));
end LowThermalMassWall_maggie;