#! /bin/bash
echo "Resizing images to 40x40"
mkdir -p ../objects
for I in {1..100}
do
	convert "../rawImages/HzMovSet1/img"$I".png"  -resize 40x40\! "../objects/img"$I".png"
	convert "../objects/img"$I".png" -colorspace Gray -separate -average "../objects/img"$I".png"
done

 
