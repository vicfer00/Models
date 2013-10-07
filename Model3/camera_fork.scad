//
// sextant fork mount for a small camera
//
// Peter Monta
// September 2013
//

//
// the main "extrusion" consisting of the fork profile and a block
// for the camera mount.  The fork dimensions are measured from a
// Celestaire Astra IIIB sextant.
//

module rail(h) {
  linear_extrude(height=h, center=false) {
    polygon(points=[
      [-10.8,-8],[15.6,-8],[15.6,-11.4],[40,-11.4],[40,11.4],[15.8,11.4],
      [15.8,-1],[7.8,-1],[7.8,-0.4],[2.7,-0.4],[2.7,-1],[-2.65,-1],[-5.25,1.6],
      [-7.85,-1],[-10.8,-1]]);
  }
}

eps = 0.01;

t1 = 5.3;       // diameter of fork gap
t2 = 11.7;      // diameter of face of sextant securing screw

difference() {
  rail(32);                                    // main body
  translate([-t1/2,-8-eps,15])                 // subtract out the fork gap
    cube(size=[t1,100,100],center=false);
  translate([0,-8-eps,15])                     // cylindrical bottom of gap
    rotate([-90,0,0])
      cylinder(h=100,r=t1/2,$fn=60);
  translate([-t2/2,-8-eps,15])                 // subtract out a small spacer area for the sextant securing screw
    cube(size=[t2,1,100],center=false);
  translate([0,-8-eps,15])                     // cylindrical part of the above
    rotate([-90,0,0])
      cylinder(h=1,r=t2/2,$fn=60);
  translate([21.8,0,-eps])                     // subtract out the hole for the 1/4-20 bolt
    cylinder(h=100,r=3.3,center=false,$fn=60);
}
