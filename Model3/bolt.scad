//
// bolt for securing a camera with 1/4-20 screw mount
//
// Peter Monta
// September 2013
//

use <threads.scad>;

//
// knob with chamfers and knurling
//

module knob(h,facets) {
  difference() {
    union() {
      cylinder(h=1,r1=9,r2=10,center=false,$fn=facets);   // lower chamfer
      translate([0,0,1])                                  // main body
        cylinder(h=13,r=10,center=false,$fn=facets);
      translate([0,0,14]) {                               // upper chamfer
        cylinder(h=1,r1=10,r2=9,center=false,$fn=facets);
      }
    }
    for (i=[0:29]) {               // chop out 30 small cylinders around edge
      rotate(i*(360/30),[0,0,1])
        translate([10,0,0])
          cylinder(h=h,r=0.6,$fn=15);
    }
  }
}
  

facets = 60;
eps = 0.01;

union() {
  knob(15,facets);                // knob
  translate([0,0,15-eps]) {       // shoulder
    cylinder(h=1,r=7,$fn=facets);
  }
  translate([0,0,16-eps]) {       // cylinder
    cylinder(h=30.5,r=6.05/2,$fn=facets);
  }
  translate([0,0,46.5-eps]) {     // threads
    metric_thread(diameter=5.9,pitch=1.27,length=5,internal=false,n_starts=1,n_segments=facets);
  }
}
