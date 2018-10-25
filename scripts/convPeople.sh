#! /bin/bash
echo "Pre-processing images"
path2write="../objects/people/"
path2read="../peopleDataSet/rawData/"
mkdir -p -- "$path2write"
angle=0


for L in  'right-left' 'approach' #
do
	seq=1
	for J in {1..100}
	do
	
		search_dir=$path2read$L"/seq"$seq
		mkdir -p $path2write$L"/seq"$seq
		I=1
		for entry in `ls $search_dir`; 
	    	do
			convert $path2read$L"/seq"$J"/"$entry -resize 320x240 -colorspace Gray -separate -average $path2write$L"/seq"$seq"/img"$I".png"
			I=$((I+1))
		done
		echo "Seq: "$J
		seq=$((seq+1))
	    done
done
  
