<<<<<<< HEAD
//
$fn=200;

RESINE_EXTRUDE = 1.1;

// Motor
MOTOR_SHAFT = 1.5;
MOTOR_DIAMETER = 17.2;
MOTOR_HOLE_DIAMETER = 6.0;
MOUNT_MINIHOLES_CIRCLE = 10.0;
MOUNT_MINIHOLES_DIAMETER = 1.7;
MOUNT_MINIHOLES_NUMBER = 6;
MOUNT_MINIHOLES_SHIFT = 0;

// Mount
MOUNT_THICK = 3.0 + RESINE_EXTRUDE;
MOUNT_HEIGHT = MOTOR_DIAMETER;
MOUNT_WIDTH = 40.0;
MOUNT_FILLET = 1.0 + RESINE_EXTRUDE;
MOUNT_WHEEL_AXLE = 3.0;
MOUNT_DISTANCE_AXLE = 27.0;



//def circle_points(number, circle, shift=0):
//    radius = circle / 2.
//    step = 360 / number
//    points = [(radius * sin(radians(i * step + shift)),
//               radius * cos(radians(i * step + shift)))
//              for i in range(number)]
//    return points

module bracket() {
    difference() {
        cube([4, 3, 4], center=true);
        rotate([90,0,0]) cylinder(d=1.6, h=3.1, center=true);
    }
}

module faulhaber_motor_mount() {
union() {    
difference() {
cube([MOUNT_WIDTH, MOUNT_HEIGHT, MOUNT_THICK], center=true);

translate([0,0,MOUNT_FILLET/2+0.1]) cylinder(d=MOTOR_DIAMETER, h=MOUNT_THICK-MOUNT_FILLET, center=true);
translate([0,0,MOUNT_FILLET/2+0.1]) cube([6, MOUNT_HEIGHT+2, MOUNT_THICK-MOUNT_FILLET], center=true);
cylinder(d=MOTOR_HOLE_DIAMETER, h=MOUNT_THICK+0.1, center=true); 
    
// Motor MiniHoles    
for(i=[1:MOUNT_MINIHOLES_NUMBER]) {
    radius = MOUNT_MINIHOLES_CIRCLE / 2;
    step = 360 / MOUNT_MINIHOLES_NUMBER;
    x = radius * sin(i * step + MOUNT_MINIHOLES_SHIFT);
    y = radius * cos(i * step + MOUNT_MINIHOLES_SHIFT);
    translate([x,y,-MOUNT_FILLET/2]) cylinder(d=MOUNT_MINIHOLES_DIAMETER, h=MOUNT_THICK+0.1, center=true);
}

// Wheels Mount    
translate([-MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);   

translate([MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);  
}
translate([MOUNT_WIDTH/2-2,-MOUNT_HEIGHT/2+1.5,MOUNT_THICK-0.1]) bracket();
translate([-MOUNT_WIDTH/2+2,-MOUNT_HEIGHT/2+1.5,MOUNT_THICK-0.1]) bracket();
}
}

module faulhaber_motor_mount_reduced() {
difference() {
union() {
translate([15.01,-1,0]) cylinder(d=10, h=MOUNT_THICK, center=true);
translate([-15.01,-1,0]) cylinder(d=10, h=MOUNT_THICK, center=true);    
difference() {
faulhaber_motor_mount();
translate([0,9,0]) cube([MOUNT_WIDTH+0.4, 10, MOUNT_THICK+0.1], center=true);
translate([17.51,1.51,0]) cube([5, 5, MOUNT_THICK+0.1], center=true);    
translate([-17.51,1.51,0]) cube([5, 5, MOUNT_THICK+0.1], center=true); 
}
    


}
// Wheels Mount    
translate([-MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);   

translate([MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);  
}
}

// test
faulhaber_motor_mount_reduced();

//color([1,0,0]) translate([0,0,-MOUNT_THICK/2+RESINE_EXTRUDE/2]) cube([MOUNT_WIDTH, MOUNT_HEIGHT, RESINE_EXTRUDE], center=true);



=======
//
$fn=200;

RESINE_EXTRUDE = 1.1;

// Motor
MOTOR_SHAFT = 1.5;
MOTOR_DIAMETER = 17.2;
MOTOR_HOLE_DIAMETER = 6.0;
MOUNT_MINIHOLES_CIRCLE = 10.0;
MOUNT_MINIHOLES_DIAMETER = 1.7;
MOUNT_MINIHOLES_NUMBER = 6;
MOUNT_MINIHOLES_SHIFT = 0;

// Mount
MOUNT_THICK = 3.0 + RESINE_EXTRUDE;
MOUNT_HEIGHT = MOTOR_DIAMETER;
MOUNT_WIDTH = 40.0;
MOUNT_FILLET = 1.0 + RESINE_EXTRUDE;
MOUNT_WHEEL_AXLE = 3.0;
MOUNT_DISTANCE_AXLE = 27.0;



//def circle_points(number, circle, shift=0):
//    radius = circle / 2.
//    step = 360 / number
//    points = [(radius * sin(radians(i * step + shift)),
//               radius * cos(radians(i * step + shift)))
//              for i in range(number)]
//    return points

module bracket() {
    difference() {
        cube([4, 3, 4], center=true);
        rotate([90,0,0]) cylinder(d=1.6, h=3.1, center=true);
    }
}

module faulhaber_motor_mount() {
union() {    
difference() {
cube([MOUNT_WIDTH, MOUNT_HEIGHT, MOUNT_THICK], center=true);

translate([0,0,MOUNT_FILLET/2+0.1]) cylinder(d=MOTOR_DIAMETER, h=MOUNT_THICK-MOUNT_FILLET, center=true);
translate([0,0,MOUNT_FILLET/2+0.1]) cube([6, MOUNT_HEIGHT+2, MOUNT_THICK-MOUNT_FILLET], center=true);
cylinder(d=MOTOR_HOLE_DIAMETER, h=MOUNT_THICK+0.1, center=true); 
    
// Motor MiniHoles    
for(i=[1:MOUNT_MINIHOLES_NUMBER]) {
    radius = MOUNT_MINIHOLES_CIRCLE / 2;
    step = 360 / MOUNT_MINIHOLES_NUMBER;
    x = radius * sin(i * step + MOUNT_MINIHOLES_SHIFT);
    y = radius * cos(i * step + MOUNT_MINIHOLES_SHIFT);
    translate([x,y,-MOUNT_FILLET/2]) cylinder(d=MOUNT_MINIHOLES_DIAMETER, h=MOUNT_THICK+0.1, center=true);
}

// Wheels Mount    
translate([-MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);   

translate([MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);  
}
translate([MOUNT_WIDTH/2-2,-MOUNT_HEIGHT/2+1.5,MOUNT_THICK-0.1]) bracket();
translate([-MOUNT_WIDTH/2+2,-MOUNT_HEIGHT/2+1.5,MOUNT_THICK-0.1]) bracket();
}
}

module faulhaber_motor_mount_reduced() {
difference() {
union() {
translate([15.01,-1,0]) cylinder(d=10, h=MOUNT_THICK, center=true);
translate([-15.01,-1,0]) cylinder(d=10, h=MOUNT_THICK, center=true);    
difference() {
faulhaber_motor_mount();
translate([0,9,0]) cube([MOUNT_WIDTH+0.4, 10, MOUNT_THICK+0.1], center=true);
translate([17.51,1.51,0]) cube([5, 5, MOUNT_THICK+0.1], center=true);    
translate([-17.51,1.51,0]) cube([5, 5, MOUNT_THICK+0.1], center=true); 
}
    


}
// Wheels Mount    
translate([-MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);   

translate([MOUNT_DISTANCE_AXLE/2,0,0]) cylinder(d=MOUNT_WHEEL_AXLE, h=MOUNT_THICK+0.1, center=true);  
}
}

// test
faulhaber_motor_mount_reduced();

//color([1,0,0]) translate([0,0,-MOUNT_THICK/2+RESINE_EXTRUDE/2]) cube([MOUNT_WIDTH, MOUNT_HEIGHT, RESINE_EXTRUDE], center=true);



>>>>>>> 9594a68b164675adb789045d41eebe502f8a0fae
