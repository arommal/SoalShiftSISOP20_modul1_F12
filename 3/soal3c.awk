#!/bin/awk -f

BEGIN{
 a=0;
 z=0;
 y=0;
}

/Location: (.*) \[following\]/ { addr[a] = $2; a++; }

END{
 for(i in a){
  for(j in a){
   if(addr[i] -eq addr[j]) { dup[z] = i; z++ }
   else { ori[y] = i; y++ }
  }
 }

 if(yl=="") {yl=-1}
 if(zl=="") {zl=-1}

 for(i in ori}{
  yl=$((yl+1))
  mv "pdkt_kusuma_$i" "kenangan/kenangan_$yl"
 }

 for(i in dup){
  zl=$((zl+1))
  mv "pdkt_kusuma_$i" "duplicate/duplicate_$zl"
 }
}
