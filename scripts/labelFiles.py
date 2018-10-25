#! /usr/bin/python
import os.path
import os

object=['baby_toy_bottle','cone','egg','flat_circular_object','pen']
movement=["left-right","left-right","right-left", "up-down", "down-up", "approach", "recede"]
for j in movement:
	for l in object:
		for i in range (1,101):
		    url2read = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/objects/'+l+"/"+j+"/seq"+str(i)+ '/'
		    url2write = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/objects/'+l+"/"+j+"/seq"+str(i)+ '/'
		    if os.path.isfile(url2write+"labels.csv"):
				print "File deleted!"
				os.remove(url2write+"labels.csv")
		    fileNames = os.listdir(url2read)
		    F2P = len(fileNames)
		    string="inconclusive"
		    for k in range(1,F2P):
		        string+=","+j
		    string+="\n"
		    print url2write+"labels.csv"
		    file=open(url2write+"labels.csv","w+")
		    file.write(string)
		    file.close()

