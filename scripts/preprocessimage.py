#
# import the OpenCV package
#import cv2
#import matplotlib.image as mpimg
#import matplotlib.pyplot as plt
import os.path
import os
#os.chdir('..')
#from sklearn.decomposition import PCA
#import numpy as np
#import imutils
#import matplotlib.cm as cm

#def rgb2gray(rgb):
#    return np.dot(rgb[...,:3], [0.299, 0.587, 0.114])

#def centerImage(grayImage):
#    centeredImage = grayImage - grayImage.mean(axis=0)
#    return centeredImage

#def make_square(im):
#    x, y = im.shape
#    if np.mod(x,2)!=0:
#        x+=1
#    if np.mod(y,2)!=0:
#        y+=1
#    size=np.max((x,y))
#    new_im=imutils.resize(im,width=size,height=size)
#    return new_im

#def whitenImage(rgbImage):
#    if len(rgbImage.shape)>2:
#        grayImage=rgb2gray(rgbImage)
#    else:
#        grayImage=rgbImage
#    grayImage=make_square(grayImage)
#    centeredImage=centerImage(grayImage)
    #pca = PCA(n_components=150, svd_solver='randomized', whiten=True).fit(grayImage)
#    grayImage=np.abs(grayImage)
#    pca = PCA(whiten=True).fit(grayImage)
    #pca = decomposition.PCA().fit(grayImage)
    # plt.figure(2, figsize=(4, 3))
    # plt.clf()
    # plt.axes([.2, .2, .7, .7])
    # plt.plot(pca.explained_variance_, linewidth=2)
    # plt.axis('tight')
    # plt.xlabel('n_components')
    # plt.ylabel('explained_variance_')
    # plt.show()
    #pipe = Pipeline(steps=[('pca', pca), ('logistic', logistic)])
#    components = pca.transform(centeredImage)
#    whitenedImage = pca.inverse_transform(components)
#    return whitenedImage


#def save_image(data, fn, reduce):
#    sizes = np.shape(data)
#    l = np.max((sizes[0], sizes[1]))
#    fig = plt.figure()
#    fig.set_size_inches(1, 1, forward=False)
#    ax = plt.Axes(fig, [0., 0., 1., 1.])
#    ax.set_axis_off()
#    fig.add_axes(ax)
#    fig.set_frameon(False)
#    ax.imshow(data, cmap=cm.Greys_r)
#    if reduce:
#        plt.savefig(fn, dpi=int(float(l) / 16.0))
#    else:
#        plt.savefig(fn, dpi=l)
#    plt.close()

for j in range(0,6):
    if j==0:
        movement = "left-right"
        movement1 = "left"
    elif j==1:
        movement = "right-left"
        movement1 = "right"
    elif j==2:
        movement = "up-down"
        movement1 = "up"
    elif j==3:
        movement = "down-up"
        movement1 = "down"
    elif j==4:
        movement = "approach"
        movement1 = movement
    elif j==5:
        movement = "recede"
        movement1 = movement

    for i in range (1,501):
        url2read = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/naturalDataSet/objects/'+movement+"/seq"+str(i)+ '/'
        url2write = os.path.expanduser('~') + '/Development/cncr_object_motion_dataset/naturalDataSet/objects/'+movement+"/seq"+str(i)+ '/'
        if os.path.isfile(url2write+"labels.csv"):
        	print "File deleted!"
    		os.remove(url2write+"labels.csv")
        fileNames = os.listdir(url2read)
        F2P = len(fileNames)
        string="inconclusive"
        for k in range(1,F2P):
            string+=","+movement1
        string+="\n"
        print url2write+"labels.csv"
        file=open(url2write+"labels.csv","w+")
        file.write(string)
        file.close()
        #for k in range(0, F2P-1):
        #    name=url+"img"+str(k+1)+".png"
        #    img = mpimg.imread(name)
        #    if j==0:
        #        #try:
        #        img=whitenImage(img)
                # except:
                #     print name
                #     plt.imshow(img,cmap='gray')
                #     plt.show()
        #    elif j==1:
        #        img=cv2.flip(img, 1)
        #    elif j==2:
        #        img= imutils.rotate_bound(img,270)
        #    else:
        #        img = imutils.rotate_bound(img, 90)
        #    name2save=url2write+"img"+str(k+1)+".png"
        #    if j == 0:
        #        save_image(img,name2save,True)
        #    else:
        #        save_image(img,name2save,False)
