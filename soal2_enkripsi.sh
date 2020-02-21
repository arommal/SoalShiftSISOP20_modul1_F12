
name=""
name=${1::-4}
hour=0
hour=$(date +"%H")
for ((num=1; $num <= $hour; num=num+1))
	do
	  name=$(echo "$name" | tr '[A-Za-z]' '[B-ZAb-za]')
	done
name+=".txt"
mv ./$1 ./$name
