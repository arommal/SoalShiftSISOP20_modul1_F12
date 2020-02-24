name=""
name=${1::-4}
lol=$(ls -i $1 | awk '{print $1;}')
#echo $lol
xd=$(date --date="$(sudo debugfs -R 'stat <'$lol'>' /dev/sda1 |& grep -Po '^crtime.*-\s\K.*$')" '+%H')
for ((num=1; $num <= $xd; num=num+1))
	do
	  name=$(echo "$name" | tr '[A-Za-z]' '[ZA-Yza-y]')
	done
name+=".txt"
mv ./$1 ./$name

