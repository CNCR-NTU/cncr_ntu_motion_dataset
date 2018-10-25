#! /bin/bash
echo "Pre-processing images"
path2write="../naturalDataSet/raw_objects/test/"
path2read="../naturalDataSet/complex/"
mkdir -p -- "$path2write"
angle=0


seq=1
for K in 'baby_toy_bottle' 'cone' 'egg' 'flat_circular_object' 'pen'
do
    for J in {1..10}
    do
    	for L in 'down-up' #'recede' #
    	do
    		#!!!!!!!!!!!!!!!!!!!CHANGE HERE vertical or looming
    		search_dir=$path2read$K"/vertical/trial"$J"/"
    		mkdir -p $path2write$L"/seq"$seq
    		I=1
    		for entry in `ls $search_dir`; 
	    	do
			#if [ "$entry" = "$searchstr" ]; 
			#then
			#	echo $search_dir
			#	echo $entry
			#fi
			#convert $search_dir"img"$I".jpg" -resize 40x40\!  $path2write$L"/seq"$seq"/img"$I".png"
			#convert $path2write$L"/seq"$seq"/img"$I".png" -colorspace Gray -separate -average $path2write$L"/seq"$seq"/img"$I".png"
			convert $search_dir"img"$I".jpg" -colorspace Gray -separate -average $path2write$L"/seq"$seq"/img"$I".png"
			I=$((I+1))
		done
		echo "Seq: "$J
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
