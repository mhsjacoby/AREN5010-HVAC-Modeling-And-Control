import matplotlib.pyplot as plt
import json
import os
# import plotly.plotly as py
# import plotly.tools as tls

path = '/Users/maggie/Documents/AREN5010-HVAC-Modeling-and-Control/Assignments/ESS/Task2/Results-HTM/'

filelist = [x for x in os.listdir(path) if x.endswith('.json')]

data_dict = {}

for f in filelist:
    with open(os.path.join(path, f)) as json_file:
        data = json.load(json_file)
        data_dict[data['n']] = data

C_opts = {}
R_opts = {}

for n in data_dict:
    C, R = [], []
    for c in data_dict[n]['c_opt']:
        C.append(c[0])
    for r in data_dict[n]['r_opt']:
        R.append(r[0])
    C_opts[n], R_opts[n] = C, R


fig = plt.figure()
for n in range(2,6):
    x = range(n)
    ax = fig.add_subplot(2,2,n-1)
    ax.bar(x, C_opts[n])
    ax.set(xticks=[])
    ax.set_title('n = {} Wall Layers'.format(n))

    #ax.set_xlabel('Wall Layer')
    #ax.set_ylabel('Distribution of Capacitance')
    #ax.set_title('Number')

fig.suptitle('Distribution of Capacitance with N wall layers', fontsize=14)    
plt.subplots_adjust(hspace =0.5)   
plt.savefig(path + 'C_opts_HTM.png')
plt.show()


fig = plt.figure()
for n in range(2,7):
    x = range(n)
    ax = fig.add_subplot(3,2,n)
    ax.bar(x, R_opts[n-1])
    ax.set(xticks=[])
#     ax.set_xlabel('Wall Layer')
    ax.set_title('n = {} Wall Layers'.format(n-1))

fig.suptitle('Distribution of Resistance with N wall layers', fontsize=14)
plt.subplots_adjust(hspace =0.5)
plt.savefig(path + 'R_opts_HTM.png')
plt.show()










