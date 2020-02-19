#!/bin/awk -f

BEGIN{
 FS=","
}

{
 if($13=="South"){
  a[$11","]+=$21
 }
}

END{
 n = asort(a, b);
 j=1;
 for (i in a){
  if(j>2) break;
  else print i, b[j]; j++;
 }
}
