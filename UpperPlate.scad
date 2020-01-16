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
                translate([8.5, 15]) square([55, 47]);
                translate([26, 11]) circle(d=6);
                translate([36, 11]) circle(d=6);
                translate([46, 11]) circle(d=6);
                translate([67, 11]) circle(d=6);
                translate([67, 19]) circle(d=6);
                translate([67, 29]) circle(d=6);
                translate([67, 39]) circle(d=6);
                translate([16.5, 61]) square([47, 20]);
                translate([80,70]) circle(d=4);
                translate([110,70]) circle(d=4);
            }
        }
        translate([0,65,0]) cube([15, 10, 1.5]);
    }
}

translate([0, 85, 13]) rotate([180, 0, 0]) UpperPlate();
