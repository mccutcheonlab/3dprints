overlap=0.001;
$fn=128;

// trough dimensions
width=65;
wall=4;
length=50;
depth=12;

trough();
//outer();
//inner();

module trough()
{
    difference()
    {
        outer();
        
        inner();
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