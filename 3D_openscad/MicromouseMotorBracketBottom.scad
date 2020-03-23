//
$fn = 100;

// x= 0.8, y= 12, z= 10, d=1

module motor_frame(x, y, z, k) {
  union() {
        cube([x, y-k, z], center = true);
        cube([x, y,  z-k], center = true);
        for(i = [ [0, (y-k)/2, (z-k)/2],
                  [0, -(y-k)/2, (z-k)/2],
                  [0, (y-k)/2, -(z-k)/2],
                  [0, -(y-k)/2, -(z-k)/2] ])
        {
        translate(i) rotate([0, 90, 0]) cylinder(d = k, h= x, center = true);        
        }
    }
}

module motor() {
    intersection() {
        cube([14, 12, 10], center = true);
        rotate([0, 90, 0]) cylinder(d = 12, h= 14, center = true);
    }
    for(i = [ [7.2, 0, 0],
              [10.5, 0, 0],
              [15.8, 0, 0] ])
    {
        translate(i) motor_frame(0.9, 12, 10, 1);
    }
    translate([8.8, 0 ,0]) motor_frame(2.6, 10.8, 8.5, 3);;
    translate([13.1, 0 ,0]) motor_frame(4.6, 10.8, 8.5, 3);
    translate([20, 0 ,0]) rotate([0, 90, 0]) cylinder(d = 3, h= 9, center = true);
}

module motor_bracket_bot() {
    difference() {
        cube([23, 18, 8.6], center = true);
        translate([-4.7, 0, 4.3]) motor();
            translate([10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);
    translate([-10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([-10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);
    }
}

module motor_bracket_top() {
    difference() {
        cube([23, 18, 6], center = true);
        translate([-4.7, 0, -3]) motor();

    translate([10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);
    translate([-10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([-10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);   
    } 
}

module lateral_support() {
    difference() {
    union() {
        rotate([0, 90, 0]) cylinder(d = 11, h = 3, center = true);
        translate([0, -3, -0.25]) cube([3, 6, 11.5], center = true);
        translate([0, 0, -3]) cube([3, 11, 6], center = true); 
        translate([-3, 3.5, -4.5]) cube([4,4,3], center = true);
     }
    translate([0, -1, 2.4]) rotate([0, 90, 0]) cylinder(d=3, h=4, center = true);
    translate([-3, 4, -4.5]) rotate([0, 0, 90]) cylinder(d=1.6, h=5, center = true);

}
}


module motor_bracket_bottom() {
//motor_bracket_bot();
motor_bracket_bot();
//translate([0,0,7.3]) motor_bracket_top();
translate([10, 15, 1.7]) lateral_support();
translate([10, -15, 1.7]) rotate([0, 0, 180]) mirror([1, 0, 0]) lateral_support();
}


// test
motor_bracket_bottom();
//motor();