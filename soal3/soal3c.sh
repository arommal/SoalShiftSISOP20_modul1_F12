mkdir duplicate
mkdir kenangan

cd duplicate
lastdup=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
lastdup=$(($lastdup+1))

cd ../kenangan
lastken=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
lastken=$((lastken+1))
cd ..

for ((i=1;i<=28;i=i+1))
do
	for ((j=$i+1;j<=28;j=j+1))
	do
		if cmp -s "pdkt_kusuma_$i" "pdkt_kusuma_$j"
		then 
			mv pdkt_kusuma_$j ./duplicate/duplicate_$lastdup
			lastdup=$(($lastdup+1))
		fi
	done
done

for ((i=1;i<=28;i=i+1))
do
	mv pdkt_kusuma_$i ./kenangan/kenangan_$lastken
	lastken=$(($lastken+1))
done
cp wget.log wget.log.bak

