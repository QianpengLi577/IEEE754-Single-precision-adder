import numpy as np
import struct

a=np.loadtxt("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/add_result.txt",delimiter="\n",dtype="str")

add_result=np.zeros(a.shape[0])
for i in range(a.shape[0]):
    add_result[i]=struct.unpack('!f', bytes.fromhex(a[i]))[0]

add=np.loadtxt("E:/CASIA/SNN_RL-co/code_part/generate_mul_data/add.txt",delimiter="\n",dtype="double")

count=sum(abs(add-add_result))/a.shape[0]

print(count)