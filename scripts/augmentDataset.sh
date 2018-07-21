#! /bin/bash
echo "Pre-processing images"
path2write="../naturalDataSet/objects/"
path2read="../naturalDataSet/objects/down-up/"
#mkdir -p path2write
angle=90
searchstr="image0.jpg"
for I in 'left-right' 'up-down' 'right-left'
do
	for J in {1..500}
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
		
	done
	angle=$((angle+90))
done
