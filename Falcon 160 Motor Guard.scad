difference() {
  // outer guard
 scale([1,.85,1]) rotate([0,0,0]) { cylinder(r=24, h=2, $fn=6, center=true); } 
// screw holes
  rotate([0,0,45])  {  translate([0,19/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }
  rotate([0,0,45])  {  translate([0,16/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }

  rotate([0,0,135]) {  translate([0,19/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }
  rotate([0,0,135]) {  translate([0,16/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }

  rotate([0,0,225]) {  translate([0,19/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }
  rotate([0,0,225]) {  translate([0,16/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }

  rotate([0,0,315]) {  translate([0,19/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }
  rotate([0,0,315]) {  translate([0,16/2,0]) {  cylinder(d=3.5, h=3, $fn=50, center=true); } }

// oil / inspection hole.
  cylinder(d=8, h=3, $fn=50, center=true); 

translate([25,0,0]) { cube([20,40,3], true); }

}

//color("Red") cube([48,1,3], true);
//color("Blue") cube([1,34,3], true);

