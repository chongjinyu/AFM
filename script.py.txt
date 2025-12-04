import pandas as pd
import os
from pathlib import Path
folder_path = r"C:\1_Jinyu\Python\afm_1024"

file_name = "al.0_00032.spm-6D08_ForceCurveIndex_0.spm.txt"
file_path = os.path.join(folder_path,file_name)

with open(file_path,'r') as file:
	content = file.read()
print(content)

import numpy as np
data_np = np.loadtxt(file_path,skiprows=1)
x_data = data_np[:,2]
y_data = data_np[:,0]

import matplotlib.pyplot as plt
plt.scatter(x_data,y_data)
plt.show()


# load all the 1024 files in folder

import os
import numpy as np
import matplotlib.pyplot as plt

folder_path = r"C:\1_Jinyu\Python\afm_1024"

plt.figure(figsize=(12,8))


for filename in os.listdir(folder_path):
	file_path = os.path.join(folder_path,filename)

	data_np = np.loadtxt(file_path,skiprows=1)
	x_data = data_np[:,2]
	y_data = data_np[:,0]
	plt.plot(x_data,y_data,alpha=0.3,linewidth=0.5)

#In python, for-loop, no need to add "end", not like MATLAB;
#In python, use indentation for each block!

plt.title("1024 AFM Curves",fontsize=16)
plt.show() 
plt.tight_layout()


# The lowest point of height is the point where tip and surface attach;
# Find the lowest height and the corresponding Defl(the position of tip);
# Save this 1024 Defl values, convert it into 32*32 matrix and plot;

import os
import numpy as np
import matplotlib.pyplot as plt

folder_path = r"C:\1_Jinyu\Python\afm_1024"


min_y_values = []
corresponding_x_values = []


for filename in os.listdir(folder_path):
	file_path = os.path.join(folder_path,filename)

	data_np = np.loadtxt(file_path,skiprows=1)
	x_data = data_np[:,2]
	y_data = data_np[:,0]
 	
	min_y = np.min(y_data)
	min_y_index = np.argmin(y_data)
	corresponding_x = x_data[min_y_index]

	min_y_values.append(min_y)
	corresponding_x_values.append(corresponding_x)

# first check the length: is 1024?
print(f"length: {len(corresponding_x_values)}")
print(f"min_y_values length: {len(min_y_values)}")


matrix_32x32 = np.array(corresponding_x_values).reshape(32, 32)

print(matrix_32x32)

x_positions = np.arange(0,32,1)
y_positions = np.arange(0,32,1)
X,Y = np.meshgrid(x_positions,y_positions)
plt.figure(figsize=(8,8))

contourf = plt.contourf(X,Y,matrix_32x32,15, cmap='coolwarm')
plt.colorbar(contourf, label='Height')
plt.tight_layout()
plt.show()
