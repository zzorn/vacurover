include <mcad/units.scad>

in_radius = 1*cm;
hub_radius = 5*cm;
hub_wall = 5*mm;
radius = 8*cm;
height = 5*cm;
wall = 1*cm;
eps = 1*mm;

module barrel(h, or, ir, bottom) {
  difference() {
    cylinder(h = h, r = or, $fn=100);
    translate([0, 0, bottom+eps]) cylinder(h = h - bottom + eps, r = ir, $fn=100);
  }
}


module ring(h, or, ir) {
  difference() {
    cylinder(h = h, r = or, $fn=100);
    translate([0,0,-eps]) cylinder(h = h + 2*eps, r = ir, $fn=100);
  }
}

difference() {
  union() {
    barrel(height, radius, radius-wall, wall);
    ring(height, hub_radius,hub_radius-hub_wall);
  
  }
  translate([0,0,-eps]) cylinder(h = height + 2*eps, r = in_radius, $fn=100);
}

