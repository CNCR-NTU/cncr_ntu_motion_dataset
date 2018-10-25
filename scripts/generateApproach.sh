#! /bin/bash
echo "Pre-processing images"
path2write="../objects/"
path2read="../objects/"
mkdir -p -- "$path2write"

for K in 'baby_toy_bottle' 'cone' 'egg' 'flat_circular_object' 'pen'
do
    for J in {1..100}
    do
	for L in 'approach' 
	do
	
		search_dir=$path2read$K"/recede/seq"$J"/"
	    	index=1
		mkdir -p $path2write$K"/"$L"/seq"$J
		count=$(find $search_dir -maxdepth 1 -type f|wc -l)
		echo $J": "$count
		for k in $(seq 1 $count)
		do
			#echo $k","$((count-$k+1))","$k
			cp  $path2read$K"/recede/seq"$J"/img"$((count-$k+1))".png" $path2write$K"/"$L"/seq"$J"/img"$k".png"
		done
	done
    done
done
