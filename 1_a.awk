#!/bin/awk -f

function findmin(val1, val2){
 if(val1<val2)
 return val1
 return val2
}

BEGIN{
 FS=","
}

{
 if($13=="South") { south+=$21; min=findmin(min, south); if(min==south) { region="South" } }
 else if($13=="West") { west+=$21; min=findmin(min, west); if(min==west) { region="West" } }
 else if($13=="Central") { central+=$21; min=findmin(min, central); if(min==central) { region="Central" } }
 else { east+=$21; min=findmin(min, east); if(min==east) { region="East" } }
}

END{
 print region
}
