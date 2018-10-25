#! /bin/bash
echo "Pre-processing images"
path2write="../objects/"
path2read="../objects/"
mkdir -p -- "$path2write"
angle=90
searchstr="image0.jpg"
for K in 'baby_toy_bottle' 'cone' 'egg' 'flat_circular_object' 'pen'
do
    for I in 'left-right' 'up-down' 'right-left'
    do
        mkdir -p $path2write$K"/"$I
        for J in {1..100}
        do
                search_dir=$path2read$K"/down-up/seq"$J"/"
                index=1
                mkdir -p $path2write$K"/"$I"/seq"$J
                count=$(find $search_dir -maxdepth 1 -type f|wc -l)
                #echo $J": "$count
                for k in $(seq 1 $count)
                do
                        convert -rotate $angle $path2read$K"/down-up/seq"$J"/img"$k".png" $path2write$K"/"$I"/seq"$J"/img"$k".png"
                done
                echo "Seq: "$J
                
        done
        angle=$((angle+90))
    done
done
