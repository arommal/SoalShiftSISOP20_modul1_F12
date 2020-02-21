#!/bin/awk -f

BEGIN { FS=","; state_a="Texas"; state_b="Illinois" }

{
 if($11==state_a || $11==state_b){
  profit_a[$17]+=$21;
 }
}

END {
 n=asort(profit_a, b);

 for(i in profit_a){
  for(j=1 ; j<=n ; j++){
   if(profit_a[i]==b[j]){ c[j] = i }
  }
 }

 for(j=1 ; j<=10 ; j++){
  print c[j], b[j]
 }
}
