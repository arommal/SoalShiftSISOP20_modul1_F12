#!/bin/awk -f

BEGIN { FS=","; state_a="Alabama"; state_b="Tennesse" }

{
 if($11==state_a || $11==state_b){
  profit_a[$17","]+=$21;
 }
}

END {
 j=1;
 n=asort(profit_a, b);

 for(i in profit_a){
  if(j>10) break;
  else print i; j++;
 }
}
