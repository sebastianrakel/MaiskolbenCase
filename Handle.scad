$fn=100;

module inlay() {
    cylinder(h=11.5, r=5);
    translate([0,0,11.5]) cylinder(h=25, r=5.5);
    translate([0,0,36.5]) cylinder(h=12, r1=5.5, r2=3.5);
    translate([0,0,48.5]) cylinder(h=11, r=2);
}

module handle() {
    difference() {
        cylinder(h=52,r=7);
        inlay();
    }
}

//inlay();
difference() {
    handle();
    translate([0,-7,0]) cube([7,14,55]);
}
