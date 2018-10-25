#! /usr/bin/python
import os.path
import os
for j in range(0,6):
    if j==0:
        movement = "left-right"
    elif j==1:
        movement = "right-left"
    elif j==2:
        movement = "up-down"
    elif j==3:
        movement = "down-up"
    elif j==4:
        movement = "approach"
    elif j==5:
        movement = "recede"

    for i in range (1,101):
        url2read = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/objects/people/'+movement+"/seq"+str(i)+ '/'
        url2write = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/objects/people/'+movement+"/seq"+str(i)+ '/'
        if os.path.isfile(url2write+"labels.csv"):
        	print "File deleted!"
    		os.remove(url2write+"labels.csv")
        fileNames = os.listdir(url2read)
        F2P = len(fileNames)
        string="inconclusive"
        for k in range(1,F2P):
            string+=","+movement
        string+="\n"
        print url2write+"labels.csv"
        file=open(url2write+"labels.csv","w+")
        file.write(string)
        file.close()
       
