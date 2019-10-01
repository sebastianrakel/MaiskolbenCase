include <Base.scad>

module BottomPlate() {
    difference() {
        union() {
             translate([80,70,3]) {
        difference() {
            cylinder(h=1, d=6);
            cylinder(h=1, d=4);
        }
    }
    
    translate([110,70,3]) {
        difference() {
            cylinder(h=1, d=6);
            cylinder(h=1, d=4);
        }
    }
            linear_extrude(thickness) {
                difference() {
                    union() {
                        difference() {                       
                            base_plate(18);                    
                            translate([15,10]) square([45, 65]);
                        }
                        translate([5,12.5]) rotate([0,0,319]) square([10,87]);
                        translate([62,5]) rotate([0,0,40]) square([10,87]);
                    }                    
            
                    translate([8, 10]) square([3,20]);
                    translate([8, 55]) square([3,20]);
                    translate([64, 10]) square([3,20]);
                    translate([64, 55]) square([3,20]);
                    translate([80,70]) circle(d=4);
                    translate([110,70]) circle(d=4);
                }    
            }
            translate([5,6, thickness]) distance_ring(4);
        }
        translate([95,70,2]) cylinder(h=1, d=21);
    }
}

BottomPlate();
