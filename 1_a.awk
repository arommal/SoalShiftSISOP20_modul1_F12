#!/bin/awk -f

BEGIN{
 FS=","
}

{
 a[$13]+=$21
}

END{
 j=1;
 for(i in a)
 {
  b[a[i]]=i;
  j++;
 }
 asort(a);
 for(i in a)
 {
  print a[i], b[a[i]]
 }
}
