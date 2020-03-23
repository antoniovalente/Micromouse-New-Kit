//
$fn = 100;
tolerance=1.1;
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
        cube([14.1, 12, 10], center = true);
        rotate([0, 90, 0]) cylinder(d = 12, h= 14.1, center = true);
    }
    for(i = [ [7.5, 0, 0],
              [10.5, 0, 0],
              [15.5, 0, 0] ])
    {
        translate(i) motor_frame(1, 12.4, 10.4, 1);
    }
    translate([9, 0 ,0]) motor_frame(3, 11, 9, 3);;
    translate([13, 0 ,0]) motor_frame(5, 11, 9, 3);
    translate([20, 0 ,0]) rotate([0, 90, 0]) cylinder(d = 3, h= 9, center = true);
}

module motor_bracket_bot() {
    difference() {
        translate([0,0,-(4+5+tolerance)/2]) cube([23, 18, 4+5+tolerance], center = true);
        translate([-4.499, 0, 0]) motor();
            
        
    translate([10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);
    translate([-10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([-10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);
    }
 //   translate([-4.499, 0, 3.7+tolerance]) motor();
}

module motor_bracket_top() {
    color([0,1,0]) difference() {
        translate([0,0,+3.5+tolerance/2]) cube([23, 18, 7+tolerance], center = true);
        translate([-4.499, 0, 0]) motor();

    translate([10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);
    translate([-10, 7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);    
    translate([-10, -7.5, 0]) rotate([0, 0, 90]) cylinder(d=1.6, h=10, center = true);   
    } 
    //translate([-4.499, 0, 0]) motor();
}

module lateral_support() {
    difference() {
    union() {
     translate([0,0, -2.5])   rotate([0, 90, 0]) cylinder(d = 11, h = 3, center = true);
        translate([-1.5, -5.5, -2.0-(7+tolerance)]) cube([3, 11, 7+tolerance]);
       translate([-1.5, -5.5, -8]) cube([3, 5.5, 11]); 
        translate([-1.5-4, 5.5-4, -2-(7+tolerance)]) cube([4,4,3+tolerance]);
     }
    translate([0, 0, 0]) rotate([0, 90, 0]) cylinder(d=3, h=4, center = true);
    translate([-1.5-2, 5.5-2, -2.5-(7+tolerance)]) rotate([0, 0, 90]) cylinder(d=1.6, h=11, center = true);

}
}

// antonio.rocha@stec.pt joana.rodrigues

module motor_bracket_bottom() {
//motor_bracket_bot();
translate([0,0,0]) motor_bracket_bot();
//translate([0,0,7.3]) motor_bracket_top();
translate([10, 14.5, 0]) lateral_support();
translate([10, -14.5, 0]) rotate([0, 0, 180]) mirror([1, 0, 0]) lateral_support();
}


// test
motor_bracket_bottom();
//translate([0,0,4.85]) motor_bracket_top();
//lateral_support();
//motor();

color([1,0,0]) translate([-25,-25,-2-7-tolerance]) cube([50,50,tolerance]);

color([1,1,0]) translate([-25,-25,-2-7]) cube([50,50,3.76]);
