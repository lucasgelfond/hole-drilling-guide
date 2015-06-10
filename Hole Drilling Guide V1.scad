/*This model serves to offer a drilling guide for where to drill new holes in order to be dead center on a multi rotor. It relies on you using current holes, already lined up to center on your multirotor to start.  For example, for me, I have holes drilled in the 45x45 to from the beginning (they were there when I bought the frame). This tool is built to allow multicopter users to drill perfectly centered new holes on their multirotor when adding new hardware (in my example, landing gear) that isn't in convenient or already had mounting patterns.
In order to use this tool, a user inputs the X and Y dimensions for that first mounting pattern already drilled on their multirotor (ie 45x45). After that, you input the X and Y dimensions for the second mounting pattern (ie 25x25) that you want to end up driling. There is an  "X" in the middle to denote center as well. Enjoy.
*/

//The hole size for the first mounting pattern on the plate.
holeSize1 = 3.5;
//The size of the holes for the second mounting pattern on the plate.
holeSize2 = 3.5;

//The X dimension of the first mounting pattern (mm, ie 45x45 mm).
pattern1X = 25;
//The Y dimension of the first mounting pattern (mm, ie 45x45 mm).
pattern1Y = 25;

//The X dimension of the second mounting pattern (mm, ie 45x45 mm).
pattern2X = 40;
//The Y dimension of the second mounting pattern (mm, ie 45x45 mm).
pattern2Y = 40;

//The size of the plate that everything is on (mm).
plateSize = 60;

//The thickness of the plate (mm).
plateThick = 3;


//The width of the "arms" for the "X" that marks center on the plate.
xWide = 2.5;
//The length of the "arms" for the "X" that marks center on the plate.
xLong = 10;

//The amount of detail for all circular/cylindrical parts.
sfn=100;

module hole1() {
    cylinder(r=holeSize1/2, h=plateThick*2, center=true, $fn=sfn);
}

module hole2() {
    cylinder(r=holeSize2/2, h=plateThick*2, center=true, $fn=sfn);
}

module pattern1() {
    translate([pattern1X/2,pattern1Y/2,0]) {
         hole1();
    }
    translate([pattern1X/-2,pattern1Y/2,0]) {
         hole1();
    }
    translate([pattern1X/2,pattern1Y/-2,0]) {
         hole1();
    }
   translate([pattern1X/-2,pattern1Y/-2,0]) {
         hole1();
    }
}
module pattern2() {
    translate([pattern2X/2,pattern2Y/2,0]) {
         hole2();
    }
    translate([pattern2X/-2,pattern2Y/2,0]) {
         hole2();
    }
    translate([pattern2X/2,pattern2Y/-2,0]) {
         hole2();
    }
   translate([pattern2X/-2,pattern2Y/-2,0]) {
         hole2();
    }
}




module xArm() {
    cube([xLong, xWide, plateThick*2], center=true);
}
module x() {
    rotate([0,0,45]) {
        xArm();
    }
    rotate([0,0,-45]) {
        xArm();
    }
}

module plate() {
    difference() {
        cube([plateSize, plateSize, plateThick],center=true);
        pattern1();
        pattern2();
        x();
    }
}

plate();