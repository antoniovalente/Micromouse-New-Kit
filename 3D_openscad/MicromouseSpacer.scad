// spacer
$fn=500;
tolerance = 1.1;

module spacer() {
difference() {
    cylinder(d=5, h=2+tolerance, center=true);
    cylinder(d=3, h=2.2+tolerance, center=true);
}
}

spacer();
