use <BottomPlate.scad>
use <UpperPlate.scad>
use <Distance.scad>
use <Stand.scad>

rotate([45,0,0]) {
     BottomPlate();
     translate([0,0,10]) UpperPlate();
     translate([80,70,5]) Distance();
}

translate([10,70,50]) {
     rotate([0,90,180]) Stand();
     translate([56,0,0]) rotate([0,90,180]) Stand();
}


