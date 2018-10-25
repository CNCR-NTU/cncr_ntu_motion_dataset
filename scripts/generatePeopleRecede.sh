#! /bin/bash
echo "Pre-processing images"
path2write="../objects/people/"
path2read="../objects/people/approach/"
mkdir -p -- "$path2write"


for J in {1..100}
do
	for L in 'recede' 
	do
	
		search_dir=$path2read"seq"$J"/"
	    	index=1
		mkdir -p $path2write$L"/seq"$J
		count=$(find $search_dir -maxdepth 1 -type f|wc -l)
		echo $J": "$count
		for k in $(seq 1 $count)
		do
			#echo $k","$((count-$k+1))","$k
			cp  $path2read"seq"$J"/img"$((count-$k+1))".png" $path2write$L"/seq"$J"/img"$k".png"
		done
	done
done
