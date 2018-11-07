#! /bin/bash
echo "Pre-processing images"
path2write="../objects/"
path2read="../naturalDataSet/simple/"
mkdir -p "$path2write"
angle=0

tp='recede' # 'down-up' #'left-right' #
nm='seq' #'trial'


for K in 'space_shuttle' #'baby_toy_bottle' 'cone' 'egg' 'flat_circular_object' 'pen' 'people'
do
    for J in {1..100}
    do
    	for L in $tp
    	do
    		search_dir=$path2read$K"/"$tp"/"$nm$J"/"
    		mkdir -p $path2write$K"/"$L"/"seq$J
    		I=1
    		for entry in `ls $search_dir`; 
	    	do
			convert $search_dir$entry -colorspace Gray -resize 320x240 -separate -average $path2write$K"/"$L"/"seq$J"/img"$I".png"
			I=$((I+1))
		done
		echo "Seq: "$J
	    done
	done
done
