include <Base.scad>

module Distance() {
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

Distance();
