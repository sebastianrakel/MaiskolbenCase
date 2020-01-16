include <Base.scad>

module Stand() {
     linear_extrude(2.5) {
          difference() {
               polygon([[0,0], [60,0], [60,60]]);
               polygon([[12.5,5], [55,5], [55,47.5]]);
          }
          //rotate([0,0,45]) square([20,3]);
          translate([-3,3,0]) {
               rotate([0,0, 315]) {
                    translate([0, 10]) square([5,19.1]);
                    translate([0, 55]) square([5,19.1]);
               }
          }
     }
}

Stand();
