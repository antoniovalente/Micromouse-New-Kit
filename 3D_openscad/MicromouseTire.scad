<<<<<<< HEAD
// Micromouse tire
$fn=200;

module full_tire() {
    difference() {
        sphere(11.9);
        translate([0,0,8.5]) cylinder(d=22, h=8, center=true);
        translate([0,0,-8.5]) cylinder(d=22, h=8, center=true);

    }
}

module tire() {
intersection() {
    
    difference() {
        full_tire();
        translate([0,0,-0.05]) cylinder(d=17, h=9.2, center=true);
    }
     
}
}

// test
//tire();
translate([0,0,4.5]) tire();
translate([0,25,4.5]) tire();
translate([25,0,4.5]) tire();
translate([25,25,4.5]) tire();
//translate([0,-25,4.5]) tire();
//translate([-25,0,4.5]) tire();
//translate([-25,-25,4.5]) tire();
//translate([25,-25,4.5]) tire();
//translate([-25,25,4.5]) tire();
//translate([-25,50,4.5]) tire();
//translate([25,50,4.5]) tire();
=======
// Micromouse tire
$fn=200;

module full_tire() {
    difference() {
        sphere(11.9);
        translate([0,0,8.5]) cylinder(d=22, h=8, center=true);
        translate([0,0,-8.5]) cylinder(d=22, h=8, center=true);

    }
}

module tire() {
intersection() {
    
    difference() {
        full_tire();
        translate([0,0,-0.05]) cylinder(d=17, h=9.2, center=true);
    }
     
}
}

// test
//tire();
translate([0,0,4.5]) tire();
translate([0,25,4.5]) tire();
translate([25,0,4.5]) tire();
translate([25,25,4.5]) tire();
//translate([0,-25,4.5]) tire();
//translate([-25,0,4.5]) tire();
//translate([-25,-25,4.5]) tire();
//translate([25,-25,4.5]) tire();
//translate([-25,25,4.5]) tire();
//translate([-25,50,4.5]) tire();
//translate([25,50,4.5]) tire();
>>>>>>> 9594a68b164675adb789045d41eebe502f8a0fae
//translate([0,50,4.5]) tire();