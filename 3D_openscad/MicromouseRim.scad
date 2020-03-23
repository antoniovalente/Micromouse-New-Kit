<<<<<<< HEAD
/* Micromouse Rim */
use <gears-master/gears.scad>;
$fn = 200;
base_diameter = 19;
flange_height = 9;
hub_diameter = 17;
rim_thickness = 3;
tolerance=1.1;

module inner_rim() {
    cylinder(d = base_diameter+2, h= 1);
    translate([0,0,flange_height+1]) cylinder(d =     base_diameter+1, h= 1);
    cylinder(d = base_diameter, h =             flange_height+2);
}


module rim() {
// spur gear
spur_gear (modul=0.5, tooth_number=40, width=4+tolerance, bore=6, pressure_angle=20, helix_angle=0, optimized=true);

// hub for bearing
difference() {
cylinder(d = 8, h = 6.02+tolerance);
translate([0, 0, 6+tolerance-2.5]) cylinder(d = 6, h = 2.55);
translate([0, 0, -0.1]) cylinder(d = 6, h = 2.51+tolerance);    
    cylinder(d=3.2, h=8);
}
    
// rim    
translate([0,0,4+tolerance]) {
    
difference() {
    inner_rim();
    translate([0, 0, rim_thickness+tolerance]) cylinder(d = base_diameter-rim_thickness, h = flange_height);
    translate([0, 0, -1*rim_thickness]) cylinder(d = hub_diameter, h = flange_height);
    
}
}
}


rim();
=======
/* Micromouse Rim */
use <gears-master/gears.scad>;
$fn = 200;
base_diameter = 19;
flange_height = 9;
hub_diameter = 17;
rim_thickness = 3;
tolerance=1.1;

module inner_rim() {
    cylinder(d = base_diameter+2, h= 1);
    translate([0,0,flange_height+1]) cylinder(d =     base_diameter+1, h= 1);
    cylinder(d = base_diameter, h =             flange_height+2);
}


module rim() {
// spur gear
spur_gear (modul=0.5, tooth_number=40, width=4+tolerance, bore=6, pressure_angle=20, helix_angle=0, optimized=true);

// hub for bearing
difference() {
cylinder(d = 8, h = 6.02+tolerance);
translate([0, 0, 6+tolerance-2.5]) cylinder(d = 6, h = 2.55);
translate([0, 0, -0.1]) cylinder(d = 6, h = 2.51+tolerance);    
    cylinder(d=3.2, h=8);
}
    
// rim    
translate([0,0,4+tolerance]) {
    
difference() {
    inner_rim();
    translate([0, 0, rim_thickness+tolerance]) cylinder(d = base_diameter-rim_thickness, h = flange_height);
    translate([0, 0, -1*rim_thickness]) cylinder(d = hub_diameter, h = flange_height);
    
}
}
}


rim();
>>>>>>> 9594a68b164675adb789045d41eebe502f8a0fae
//translate([0,30,0]) rim();