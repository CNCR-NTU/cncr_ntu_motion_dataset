#! /bin/bash
echo "Resizing images to 40x40"
mkdir -p ../objects
angle=0
for K in 'left-right' 'up-down' 'right-left' 'down-up'
do
    for J in {1..100}
    do
        mkdir -p "../objects/"$K"/seq"$J
        for I in {1..50}
        do
                convert "../rawImages/HzMovSet1/img"$I".png"  -resize 40x40\! "../objects/"$K"/seq"$J"/img"$I".png"
                convert "../objects/"$K"/seq"$J"/img"$I".png" -colorspace Gray -separate -average "../objects/"$K"/seq"$J"/img"$I".png"
                convert -rotate $angle "../objects/"$K"/seq"$J"/img"$I".png" "../objects/"$K"/seq"$J"/img"$I".png"
        done
    done
    angle=$((angle+90))
    echo $angle
done
