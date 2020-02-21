nama=$1
cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 > $nama.txt
