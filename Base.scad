$fn=100;
thickness = 3;

module soldering_hole(hole_diameter, open=false) {
    difference() {
        square([35,30]);
        translate([15,15]) hull() {
            circle(d=hole_diameter);
            if(open) {
                translate([0, 20]) circle(d=hole_diameter);
            }
        }
    }
}

module distance_ring(height) {
    linear_extrude(height) {
        difference() {
            holes(6);
            holes(4);
        }
    }
}

module holes(diameter=4) {
    hole_row(diameter);
    translate([0, 73]) hole_row(diameter);
}

module hole_row(diameter=4) {
    circle(d=diameter);
    translate([67,0]) circle(d=diameter);
}

module base_plate(hole_diameter, open) {
    difference() {
        square([80, 85]);
        translate([5,6]) holes();
    }
    translate([80, 55]) soldering_hole(hole_diameter, open);
}
