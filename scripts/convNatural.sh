#! /bin/bash
echo "Preporcessing images"
path2write = "../naturalDataSet/objects"
path2read = "../naturalDataSet/simple/"
#mkdir -p path2write
angle=0
for K in 'baby_toy_bottle' 'cone' 'egg' 'flat_circular_object' 'pen'
do
    for J in {1..100}
    do
    	search_dir=$path2read+$K"/vertical/trial"$J"/"
    	echo $search)dir
    	for entry in `ls $search_dir`; do
    		echo $entry
	done
        #mkdir -p "../objects/"$K"/seq"$J
        #for I in {1..50}
        #do
        #        convert "../rawImages/HzMovSet1/img"$I".png"  -resize 40x40\! "../objects/"$K"/seq"$J"/img"$I".png"
        #        convert "../objects/"$K"/seq"$J"/img"$I".png" -colorspace Gray -separate -average "../objects/"$K"/seq"$J"/img"$I".png"
        #        convert -rotate $angle "../objects/"$K"/seq"$J"/img"$I".png" "../objects/"$K"/seq"$J"/img"$I".png"
        #done
    done
    #angle=$((angle+90))
    #echo $angle
done
