overlap=0.001;
$fn=128;

// panel dimensions
pwidth=72;
pthick=2;
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

//screwhole();

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
        
        translate([20,0,0])
        screwhole();
        
        translate([-20,0,0])
        screwhole();
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

module screwhole()
{
    translate([0,10,-2])
    cylinder(h=pthick*2, d=3);
}