overlap=0.001;
$fn=128;

// trough dimensions
width=65;
wall=4;
length=50;
depth=12;

// hole dimensions
screw=3;

trough();
//outer();
//inner();

// hole();

module trough()
{
    difference()
    {
        outer(); 
        inner();
        
        translate([20,length/2,0])
        hole();
        
        translate([-20,length/2,0])
        hole();
    }

}
        

module outer()
{
    cube(size=[width,length,depth], center=true);
}

module inner()
{
    translate([0,0,wall/2])
    cube(size=[width-wall,length-wall,depth], center=true);
}

module hole()
{    
    rotate([90,0,0])
    cylinder(h=wall, d=screw);
}
