slotwidth = 2.8;
plateheight=2;
spacer_sep = 13.16;
rear_height=16.81;
front_height=29.76;
spacer_diameter=5.4;

$fn = 100;

module cylinder_outer(height,radius,fn) {
 fudge = 1/cos(180/fn);
 cylinder(h=height,r=radius*fudge,$fn=fn, center=true);
}

module AntennaHolder() {
  difference() {
    translate([0,0,0]) { cylinder(r=3.5,   h=15,   center=true); } // exterior shape
    translate([0,0,2]) { cylinder(r=1.6,   h=15.1, center=true); } //antenna straw hole
    translate([0,0,0]) { cylinder(r=1.1,   h=15.1, center=true); } // antenna via
  }
}

module CamBraceAndAntenna () {
  difference() {
    union() {
      // interspacer gap width was 3, made into 2.
      translate([1.5,0,front_height/2+3.5]) { cube([2, spacer_sep, front_height-4], true); }
      
      // rear threaded spacer
      translate([0,-(spacer_sep/2)-(spacer_diameter/2),rear_height/2]) {
        difference() {
          translate([0,0,3]) {
            cylinder(d=spacer_diameter+3, h=rear_height+6, $fn=100, center=true);
          }
          cylinder_outer(rear_height+10, spacer_diameter/2, 100); 
        }
      }
      // front threaded spacer
      translate([0,(spacer_sep/2)+(spacer_diameter/2),front_height/2]) {
        difference() {
          translate([0,0,3]) {
            cylinder(d=spacer_diameter+3, h=front_height+6, $fn=100, center=true);
          }
          cylinder_outer(front_height+10, spacer_diameter/2, 100); 
        }
      }
    }
  // angle at the top
    translate([0,-2,front_height]) { rotate([35, 0, 0]) { cube([spacer_diameter+3, 35, 10], true);  } }
  // little space for the cam (55 is 90-35, it makes sense)
    translate([-5,5,16]) { rotate([-55,0,0]) { cylinder(d=10, h=30, $fn=100, center=true);} }
// some space on top for a strap to hold the hdcam on
    translate([1.5,0,24]) rotate([35,0,0]) cube([2.1,11.5,4], true);

// knock out some space for the top plate's screw in front
    translate([0,15.5,0]) rotate([70,0,0]) cube([15,146,11], true); 

// and on the back screw
    translate([0,-15.5,0]) rotate([-60,0,0]) cube([10,146,11], true); 

// blank out the antenna holder from the main body before adding it back in.
    translate([6.0,3.6,11.5]) { rotate([0,25,0]) { cylinder(r=2,   h=15,   center=true); } } 

  }

  // add on the antenna mount and brace.
  translate([6.0,3.6,11.5]) {
    rotate([0,25,0]) {
      union() {
        difference() {
          translate([-6,0,0])  cube([8,3,15], true); // mounting plate
// was 30,5,30
          translate([-23,0,-.2]) rotate([0,-25,0]) cube([32,7,32], true); // lop off the part of it in the middle that isn't a plate
        }
        difference() {
          AntennaHolder();
          translate([2,0,-7.9]) {rotate([0,-25,0]) { cube([8,8,4], true); } } // lop off the angled base
          translate([-4,0,-7.9]) {rotate([0,-25,0]) { cube([4,4,2], true); } } // lop off the internal nib
        }

      }
    }
  }
}


// something for the OSD to stick to...
translate([0,-12.48,11.5]) {
  difference() {
    cube([30.5,2,8], true);
// clean out the cylinders
    translate([-30.5/2,spacer_diameter/2,0]) cylinder_outer(rear_height+1, spacer_diameter/2, 100);
    translate([30.5/2,spacer_diameter/2,0]) cylinder_outer(rear_height+1, spacer_diameter/2, 100);
// some notches for zip ties holding the beeper/LED on.
    translate([-6.5,0, 4.1]) { cube([3,5,2], true); }
    translate([-6.5,0,-4.1]) { cube([3,5,2], true); }
    translate([ 6.5,0, 4.1]) { cube([3,5,2], true); }
    translate([ 6.5,0,-4.1]) { cube([3,5,2], true); }
  }
}

// beeper width gauge
//translate([0,-12.5,16]) { color("Red") cube([10,1,1], true); }

// Raw
//CamBraceAndAntenna();

// Right side
translate([30.5/2,0,0]) CamBraceAndAntenna();

// Left side
translate([-30.5/2,0,0]) mirror([1,0,0])  CamBraceAndAntenna();



/*
//  translate([6.5,3.6,10]) {
//    rotate([0,25,0]) {
      union() {
        difference() {
          translate([-6.5,0,0])  cube([9,3,15], true);
          translate([-23,0,-.2]) rotate([0,-25,0]) cube([30,5,30], true);
        }
        AntennaHolder();
      }
//    }
//  }
*/