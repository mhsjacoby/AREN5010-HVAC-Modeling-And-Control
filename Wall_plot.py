# Used in Tasks 1, 2 for plotting modelica output
# original code from Gregor Henze/Yangyang Fu

from buildingspy.io.outputfile import Reader
import matplotlib.pyplot as plt

Path = "/Users/maggie/Documents/AREN5010-HVAC-Modeling-and-Control/Modeling/OpenModelica/Task1_scenarios/"


resultFile = "LTM_full_excite/LTM-full_excite.mat"
fname = "LTM"

#resultFile = "LightWallTestScenario/LWT.mat"
#fname = "LWT"

r = Reader(Path + resultFile, "dymola")

(time, Ts_ext) = r.values(fname + '.Ts_ext')
(time, Ts_int) = r.values(fname + '.Ts_int')
(time, T_ext) = r.values(fname + '.T_ext')
(time, T_int) = r.values(fname + '.T_int')
(time, qs_ext) = r.values(fname + '.qs_ext')
(time, qs_int) = r.values(fname + '.qs_int')


print(len(time), len(Ts_ext), len(Ts_int), len(T_ext), len(T_int), len(qs_ext), len(qs_int))

# Plot figure
fig = plt.figure()
ax = fig.add_subplot(211)

ax.plot(time / 3600, Ts_ext - 273.15, 'r', label='$T_{s,ext}$')
ax.plot(time / 3600, Ts_int - 273.15, 'b', label='$T_{s,int}$')
ax.plot(time / 3600, T_ext - 273.15, 'g', label='$T_{ext}$')
ax.plot(time / 3600, T_int - 273.15, 'k', label='$T_{int}$')
ax.set_xlabel('Time [h]')
ax.set_ylabel(r'Surface temperature [$^\circ$C]')

ax.set_xticks(list(range(49)),12)
ax.set_xlim([0, 48])
ax.legend()
ax.grid(True)

ax = fig.add_subplot(212)
ax.plot(time / 3600, qs_ext, 'r', label='$\dot{q}_{s,ext}$')
ax.plot(time / 3600, qs_int, 'b', label='$\dot{q}_{s,int}$')
ax.set_xlabel('Time [h]')
ax.set_ylabel(r'Surface heat flux [W/m$^2$]')

ax.set_xticks(list(range(49)),12)
ax.set_xlim([0, 48])
ax.legend()
ax.grid(True)

fig.suptitle('Time Response to Heavy Excitations in a Low Thermal Capacity Wall', fontsize=10)
plt.subplots_adjust(hspace =0.5)

plt.savefig('/Users/maggie/Documents/AREN5010-HVAC-Modeling-and-Control/Assignments/ESS/Task2/LTM_full')
plt.show()
