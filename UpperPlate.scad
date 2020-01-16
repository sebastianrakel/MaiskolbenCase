include <Base.scad>

module UpperPlate(){
    translate([5,6]) distance_ring(10);
    translate([80,70]) {
        difference() {
            cylinder(h=12, d=6);
            cylinder(h=12, d=4);
        }
    }

    translate([110,70]) {
        difference() {
            cylinder(h=12, d=6);
            cylinder(h=12, d=4);
        }
    }

    translate([0,0,10]) 
    difference() {
        linear_extrude(thickness) {
            difference() {
                base_plate(18, true);
                translate([8.5, 16]) square([55, 47]);
                translate([25.5, 12.5]) circle(d=4.5);
                translate([35.5, 12.5]) circle(d=4.5);
                translate([45.5, 12.5]) circle(d=4.5);
                translate([66, 12.5]) circle(d=4.5);
                translate([66.5, 21]) circle(d=5);
                translate([66, 29.5]) circle(d=4.5);
                translate([66, 40]) circle(d=4.5);
                translate([16.5, 61]) square([47, 20]);
                translate([80,70]) circle(d=4);
                translate([110,70]) circle(d=4);
            }
        }
        translate([0,65,0]) cube([15, 10, 1.5]);
    }
}

translate([0, 85, 13]) rotate([180, 0, 0]) UpperPlate();
