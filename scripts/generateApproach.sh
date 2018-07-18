#! /bin/bash
echo "Pre-processing images"
path2write="../naturalDataSet/objects/"
path2read="../naturalDataSet/objects/recede/"
#mkdir -p path2write
angle=0
searchstr="image0.jpg"

for J in {1..500}
do
	for L in 'approach' 
	do
	
		search_dir=$path2read"seq"$J"/"
	    	index=1
		mkdir -p $path2write$L"/seq"$J
		count=$(find $search_dir -maxdepth 1 -type f|wc -l)
		#echo $J": "$count
		for k in $(seq 1 $count)
		do
			cp  $path2read"seq"$J"/img"$k".png" $path2write$L"/seq"$J"/img"$((count-$k+1))".png"
		done
		#for entry in `ls $search_dir`; 
	    	#do
	    	#done
	done
done
