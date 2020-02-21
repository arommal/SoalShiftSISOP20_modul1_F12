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
 print b[a[2]];
}
