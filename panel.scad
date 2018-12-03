overlap=0.001;
$fn=128;

// panel dimensions
pwidth=30;
pthick=3;
pheight=50;

// tube dimensions
tlength=20;
tOD = 12;
tID = 9;
tube_protrude=4;

clipfrontdepth=10;


panelwithhole();
// hole();
//clipfront();

module panelwithhole()
{
    difference()
    {
        union()
        {
            panel();
            
            translate([0,0,-tube_protrude])
            rotate([45,0,0])
            tube();
        }
        
        clipfront();
        
        translate([0,0,-tube_protrude])
        rotate([45,0,0])
        hole();
    }
}

module panel()
{
    translate([0,0,pthick/2])
    cube(size=[pwidth,pheight,pthick], center=true);
}

module tube()
{
    cylinder(h=tlength, d=tOD);
}

module hole()
{
    cylinder(h=tlength+pthick+1, d=tID);
}

module clipfront()
{
    translate([0,-tube_protrude,-clipfrontdepth/2])
    cube(size=[pwidth,tOD*2,clipfrontdepth], center=true);
}