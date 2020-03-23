// Micromouse 2 Print (Resin)
use <MicromouseFront.scad>
use <MicromouseMotorBracket.scad>
use <MicromouseRim.scad>
use <MicromousePinion.scad>
use <MicromouseSpacer.scad>
use <MicromouseFaulhaberMount.scad>


translate([-1,11,0]) rim();
translate([-1,-11,0]) rim();
translate([-1,34,0]) rim();
translate([-1,-34,0]) rim();

translate([31,10,9+1.1]) motor_bracket_bottom();
rotate([0,0,180]) translate([-23,10,9+1.1]) motor_bracket_bottom();

rotate([0,180,0]) translate([-31,-30,-8.1]) motor_bracket_top();

rotate([0,180,0]) translate([-23,30,-8.1]) motor_bracket_top();

translate([14.5,16,0]) pinion();

translate([14.5,-36,0]) pinion();

//translate([-14,12,1.55]) spacer();
//translate([-14,20,1.55]) spacer();
//translate([-20,12,1.55]) spacer();
//translate([-20,20,1.55]) spacer();
//translate([-26,12,1.55]) spacer();
//translate([-26,20,1.55]) spacer();
//translate([-32,12,1.55]) spacer();
//translate([-32,20,1.55]) spacer();


// for FaulHaber Motor Micromouse
translate([-22,-22,2.2]) rotate([0,0,90]) faulhaber_motor_mount_reduced();

translate([-22,22,2.2]) rotate([0,0,90]) faulhaber_motor_mount_reduced();

translate([39,35,0]) pinion_faulhaber();

translate([39,-15,0]) pinion_faulhaber();

translate([-38,11,0]) rim();
translate([-38,-11,0]) rim();
translate([-38,34,0]) rim();
translate([-38,-34,0]) rim();