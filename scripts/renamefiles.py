import os.path
import os
import numpy as np

from os import listdir
 
def list_files(directory, extension):
    return (f for f in listdir(directory) if f.endswith('.' + extension))
    
url2read = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/naturalDataSet/simple/'
url2write = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/naturalDataSet/simple/' # baby_toy_bottle/looming/trial56/
objs=['baby_toy_bottle', 'cone', 'egg', 'flat_circular_object', 'pen']
mov=['vertical','looming']
for h in range(0, len(mov)):
	for k in range (0,len(objs)):
	    for J in range(1,101):
	    	files = list_files(url2read+objs[k]+"/"+mov[h]+"/trial"+str(J)+"/",'jpg')
		filen=[]
		newfilenames=[]
		for f in files:
			tmp=''
			fd=unicode(f, 'utf-8')
			for j in range(0,len(fd)):
				if fd[j].isnumeric():
					tmp+=fd[j]
			newfilenames.append(tmp)
			filen.append(f)
		newfilenames=np.array(newfilenames,np.int)
		newfilenames=newfilenames - newfilenames.min()+1
		#print filen, newfilenames
		for i in range(0,len(filen)):
			a=url2read+objs[k]+"/"+mov[h]+"/trial"+str(J)+"/"+filen[i]
			b=url2write+objs[k]+"/"+mov[h]+"/trial"+str(J)+"/img"+str(newfilenames[i])+".jpg"
			#print a
			#print b
			os.rename(url2read+objs[k]+"/"+mov[h]+"/trial"+str(J)+"/"+filen[i],url2write+objs[k]+"/"+mov[h]+"/trial"+str(J)+"/img"+str(newfilenames[i])+".jpg")

