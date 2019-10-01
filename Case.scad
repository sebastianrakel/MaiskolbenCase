$fn=100;

mode=0;
thickness=3;

module distance_ring(height) {
    linear_extrude(height) {
        difference() {
            holes(6);
            holes(4);
        }
    }
}

module hole_row(diameter=4) {
    circle(d=diameter);
    translate([67,0]) circle(d=diameter);
}

module holes(diameter=4) {
    hole_row(diameter);
    translate([0, 73]) hole_row(diameter);
}

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

module base_plate(hole_diameter, open) {
    difference() {
        square([80, 85]);
        translate([5,6]) holes();        
    }
    translate([80, 55]) soldering_hole(hole_diameter, open);
}

module bottom_plate() {
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

module long_hole() {
    hull() {
        circle(d=2);
        translate([48,0]) circle(d=2);
    }
}

module upper_plate(){
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
        //square([12, 15, 1.5]);
    }
}

module distanz() {
    difference() {
    hull() {
        translate([15,0]) {        
            cylinder(h=2,d=26);
        }
        translate([30,0]) {
            cylinder(h=2,d=6);
        }
       
        cylinder(h=2,d=6);
    }
    cylinder(h=2,d=4);
    translate([30,0]) cylinder(h=2,d=4);
    translate([15,0]) cylinder(h=2,d=18);     
    }

    translate([0,0, 2]) {
        difference() {
            cylinder(h=3,d=6);
            cylinder(h=3,d=4);
        }
    }
        
    translate([30,0, 2]) {
        difference() {
            cylinder(h=3,d=6);
            cylinder(h=3,d=4);
        }
    }
    
       
}

module stand() {
    linear_extrude(2.5) {
        difference() {
            polygon([[0,0], [60,0], [60,60]]);
            polygon([[12.5,5], [55,5], [55,47.5]]);
        }
        //rotate([0,0,45]) square([20,3]);
        translate([-3,3,0]) {
            rotate([0,0, 315]) {        
                translate([0, 10]) square([5,19]);
                translate([0, 55]) square([5,19]);
            }
        }
    }
}

if (mode == 1) {
    bottom_plate();
} else if (mode == 2) {
    upper_plate();
} else if (mode == 3) {
    distanz();
} else if (mode == 4) {
    stand();
} else {    
    rotate([45,0,0]) {
        bottom_plate();
        translate([0,0,10]) upper_plate();    
        translate([80,70,5])distanz();    
    }
    translate([10,70,50]) {
        rotate([0,90,180]) stand();
        translate([56,0,0]) rotate([0,90,180]) stand();
    }
}

