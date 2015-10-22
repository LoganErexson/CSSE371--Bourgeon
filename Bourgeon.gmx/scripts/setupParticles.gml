// Setup particle systems
global.P_System = part_system_create();
part_system_depth(global.P_System, 0);             //Particles draw in front of everything

global.P_System_Behind = part_system_create();
part_system_depth(global.P_System_Behind, 1);                    //Particles draw behind everything


// Small bubbles
global.Bubble = part_type_create();
part_type_shape(global.Bubble,pt_shape_ring);             //This defines the particles shape
part_type_size(global.Bubble,.02,.08,0,0);                //This is for the size
part_type_scale(global.Bubble,1,1);                       //This is for scaling
part_type_color1(global.Bubble,c_white);                  //This sets its colour. There are three different codes for this
part_type_alpha2(global.Bubble,1,0.5);                    //This is its alpha. There are three different codes for this
part_type_speed(global.Bubble,0.01, 4, 0, .2);            //The particles speed
part_type_direction(global.Bubble,0,359,0,20);            //The direction
part_type_orientation(global.Bubble,0,0,0,0,1);           //This changes the rotation of the particle
part_type_blend(global.Bubble,false);                     //This is the blend mode, either additive or normal
part_type_life(global.Bubble,50, 150);                
part_type_gravity(global.Bubble, 0.08, 90);

// Create an array of cloud particles
// (different colors for different chems)
globalvar chemparticles;

// Typical toxin cloud particle type
var i;
for(i=0; i<array_length_1d(global.chemicals); i++)
{
    Particle = part_type_create();
    part_type_shape(Particle,pt_shape_smoke);         //This defines the particles shape
    part_type_size(Particle,.3,1,-0.001,0);           //This is for the size
    part_type_scale(Particle,1,1);                    //This is for scaling
    part_type_color1(Particle,global.chemcolors[i]);               //This sets its colour. There are three different codes for this
    part_type_alpha2(Particle,0.45, 0.1);             //This is its alpha. There are three different codes for this
    part_type_speed(Particle,0,.1,-.01,.15);          //The particles speed
    part_type_direction(Particle,0,359,0,20);         //The direction
    part_type_orientation(Particle,0,359,0,0,0);      //This changes the rotation of the particle
    part_type_blend(Particle,true);                   //This is the blend mode, either additive or normal
    part_type_life(Particle,150,250);                  //This is its lifespan in steps
    global.chemparticles[i] = Particle;
}
