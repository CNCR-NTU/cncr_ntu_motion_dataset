#! /bin/bash
k=96
start=1
stop=100

# do not change!!!
i=$start
j=1
while [ $i -le $stop ]
do
	echo "Moving img$i.png to HzMovSet$k/img$j.png"
	mv img$i.png HzMovSet$k/img$j.png
	((i++))
	((j++))
done
