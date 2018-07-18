#! /bin/bash
echo "Pre-processing images"
path2write="../naturalDataSet/objects/"
path2read="../naturalDataSet/simple/"
#mkdir -p path2write
angle=0
searchstr="image0.jpg"

seq=1
for K in 'baby_toy_bottle' 'cone' 'egg' 'flat_circular_object' 'pen'
do
    for J in {1..100}
    do
    	for L in 'recede' 
    	do
    		search_dir=$path2read$K"/vertical/trial"$J"/"
    	    	index=1
    		#mkdir -p $path2write$L"/seq"$seq
    		for entry in `ls $search_dir`; 
	    	do
			if [ "$entry" = "$searchstr" ]; 
			then
				echo $search_dir
				echo $entry
			fi
			## Special case of recede objs
			#convert $search_dir$entry -resize 40x40\!  $path2write$L"/seq"$seq"/img"$index".png"
			#convert $path2write$L"/seq"$seq"/img"$index".png" -colorspace Gray -separate -average $path2write$L"/seq"$seq"/img"$index".png"
			
			index=$((index+1))
		done
		index=0
		seq=$((seq+1))
		#mkdir -p "../objects/"$K"/seq"$J
		#for I in {1..50}
		#do
		#        convert "../rawImages/HzMovSet1/img"$I".png"  -resize 40x40\! "../objects/"$K"/seq"$J"/img"$I".png"
		#        convert "../objects/"$K"/seq"$J"/img"$I".png" -colorspace Gray -separate -average "../objects/"$K"/seq"$J"/img"$I".png"
		#        convert -rotate $angle "../objects/"$K"/seq"$J"/img"$I".png" "../objects/"$K"/seq"$J"/img"$I".png"
		#done
	    done
	done
  
    #angle=$((angle+90))
    #echo $angle
done
