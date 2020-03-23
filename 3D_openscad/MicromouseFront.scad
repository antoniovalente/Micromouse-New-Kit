$fn=200;

module _thru_hole_led(
    // default: 5mm LED
    //      sized from https://www.adafruit.com/product/1938
    //      no tolerances applied - will be to size or under
    //      *** INTERNAL USE ONLY ***
    //      *** don't call this, use thru_hole_led() ***
    diameter        =    5,
    height          =    8.7,
    base_diameter   =    5.8,
    flange_height   =    1      ) {
    union() {
        difference() {
            cylinder(d = base_diameter, h = flange_height);
            translate([diameter, 0, 0])cube(diameter, center = true);
        }                       // flange

        cylinder(h = height - (diameter / 2),
            d=diameter);                      // body
        
        translate([0, 0, height - (diameter / 2)])sphere(
            d=diameter);                      // tip
    }
}

module thru_hole_led(
    diameter        =    5,
    height          =    8.7,
    base_diameter   =    5.8,
    flange_height   =    1,
    tolerance       =    0.2    ) {
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}    


module led5mm_cutout() {
    // negative space to remove to allow a 5mm LED to fit
    diameter        =    5;
    height          =    8.7;
    base_diameter   =    5.8;
    flange_height   =    1;
    tolerance       =    0.2 + 0.2;
    _thru_hole_led(diameter = diameter + 2 * tolerance, height = height + tolerance, base_diameter = base_diameter + 2 * tolerance, flange_height = flange_height + tolerance);
}

module micromouse_front() {
difference(){
    translate([0, 0,4]) 
    rotate([0,0,0])
    scale(1)
    linear_extrude(height = 8, center = true, $fn=200) 
    import(file = "MicromouseFront.svg");

    // LED FLE
    translate([5.0, 0.7,4]) 
    rotate([-90,0,9])
    led5mm_cutout();

    translate([5.0, 0.7,4]) 
    rotate([90,0,9])
    cylinder(h=40,r=1, center=true);

    
    // LED FLR
    translate([12.0, 9.6,4]) 
    rotate([-90,0,11])
    led5mm_cutout();

    translate([12.0, 9.6,4]) 
    rotate([90,0,11])
    cylinder(h=30,r=2, center=true);

    // LED DLR
    translate([28, 18.8,4]) 
    rotate([-90,0,55])
    led5mm_cutout();

    translate([28.0, 18.8,4]) 
    rotate([90,0,55])
    cylinder(h=30,r=2, center=true);

    // LED DLE
    translate([38.7, 21.7,4]) 
    rotate([-90,0,60])
    led5mm_cutout();

    translate([38.7, 21.7,4]) 
    rotate([90,0,60])
    cylinder(h=30,r=1, center=true);
    
    ///////////////////////////////////
    // LED DRE
    translate([88.0, 0.7,4]) 
    rotate([-90,0,-9])
    led5mm_cutout();

    translate([88.0, 0.7,4]) 
    rotate([90,0,-9])
    cylinder(h=40,r=1, center=true);

    
    // LED DRR
    translate([80.2, 9.6,4]) 
    rotate([-90,0,-11])
    led5mm_cutout();

    translate([80.2, 9.6,4]) 
    rotate([90,0,-11])
    cylinder(h=30,r=2, center=true, $fn=50);

    // LED FRR
    translate([64.7, 18.8,4]) 
    rotate([-90,0,-55])
    led5mm_cutout();

    translate([64.7, 18.8,4]) 
    rotate([90,0,-55])
    cylinder(h=30,r=2, center=true);

    // LED FRE
    translate([54.0, 21.7,4]) 
    rotate([-90,0,-60])
    led5mm_cutout();

    translate([54.0, 21.7,4]) 
    rotate([90,0,-60])
    cylinder(h=30,r=1, center=true);
}    
}    


// test
micromouse_front();

