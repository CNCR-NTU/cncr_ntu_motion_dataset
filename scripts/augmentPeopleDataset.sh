#! /bin/bash
echo "Pre-processing images"
path2write="../objects/people/"
path2read="../objects/people/right-left/"
mkdir -p -- "$path2write"
angle=90
for I in  'down-up' 'left-right' 'up-down'
do
	for J in {1..100}
	do
		search_dir=$path2read"seq"$J"/"
	    	index=1
		mkdir -p $path2write$I"/seq"$J
		count=$(find $search_dir -maxdepth 1 -type f|wc -l)
		#echo $J": "$count
		for k in $(seq 1 $count)
		do
			convert -rotate $angle $path2read"seq"$J"/img"$k".png" $path2write$I"/seq"$J"/img"$k".png"
		done
		echo "Seq: "$J
		
	done
	angle=$((angle+90))
done
