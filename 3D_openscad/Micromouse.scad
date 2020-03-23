use <MicromousePCB.scad>
use <MicromouseFront.scad>
use <MicromouseMotorBracket.scad>
use <MicromouseRim.scad>
use <MicromousePinion.scad>

// PCB color - In the RGB color model #296e01 is comprised of 16.08% red, 43.14% green and 0.39% blue (0.1608, 0.4314, 0.39)

color("#296e01") micromouse_PCB();
translate([0,73, 1]) color("#3f3f3f") micromouse_front();
rotate([0, 0, 180]) translate([-27.5,-38.5,4.7]) color("#3f3f3f") motor_bracket_bottom();
rotate([0, 0, 0]) translate([65,38.5,4.7]) color("#3f3f3f") motor_bracket_bottom();

translate([14, 24.6, 9.1]) rotate([0, -90, 0]) rim();
translate([14, 52.3, 9.1]) rotate([0, -90, 0]) rim();

translate([79, 24.5, 8.7]) rotate([0, 90, 0]) rim();
translate([79, 52, 8.7]) rotate([0, 90, 0]) rim();

translate([60.5,38.5,8.7]) motor();
translate([31.8,38.5,8.7]) rotate([0, 0, 180]) motor();

color([0,1,0]) translate([9.2,38.5,8.7]) rotate([0,90,0]) pinion();

color([0,1,0]) translate([77.2,38.5,8.7]) rotate([0,90,0]) pinion();