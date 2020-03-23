/* Micromouse Pinion */
use <gears-master/gears.scad>;
$fn = 200;
tolerance=1.1;

module pinion() {
spur_gear (modul=0.5, tooth_number=16, width=5+tolerance, bore=3.05, pressure_angle=20, helix_angle=0, optimized=true);
translate([0,1.5-(0.54/2),2.5+tolerance/2]) cube([3,0.54,5+tolerance], center=true);
}

module pinion_faulhaber() {
spur_gear (modul=0.5, tooth_number=12, width=5+tolerance, bore=1.48, pressure_angle=20, helix_angle=0, optimized=true);
}


pinion_faulhaber();