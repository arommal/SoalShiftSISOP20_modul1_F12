#!/bin/awk -f

BEGIN{
 FS=","
}

{
 if($13=="Central"){
  a[$11]+=$21
 }
}

END{

 for (i in a){
  b[a[i]]=i;
 }
 asort(a);
 for(i in a){
  if(i>2) break;
  else print b[a[i]], a[i];
 }
}
