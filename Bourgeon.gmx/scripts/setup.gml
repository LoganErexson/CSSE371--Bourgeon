// Chem cloud particle stuff
global.P_System = part_system_create();
part_system_depth(global.P_System, 0);                        // particles draw on top of everything

// Background floaty particles
global.bgParticle = part_type_create();
part_type_shape(global.bgParticle,pt_shape_pixel);            //This defines the particles shape
part_type_size(global.bgParticle,.3,.9,0,0);                    //This is for the size
part_type_scale(global.bgParticle,1,1);                       //This is for scaling
part_type_color1(global.bgParticle,c_white);                  //This sets its colour. There are three different codes for this
part_type_alpha2(global.bgParticle,1,0.5);                        //This is its alpha. There are three different codes for this
part_type_speed(global.bgParticle,0.01, 4, 0, .2);            //The particles speed
part_type_direction(global.bgParticle,0,359,0,20);            //The direction
part_type_orientation(global.bgParticle,0,0,0,0,1);           //This changes the rotation of the particle
part_type_blend(global.bgParticle,true);                         //This is the blend mode, either additive or normal
part_type_life(global.bgParticle,50, 150);                
part_type_gravity(global.bgParticle, 0.08, 90);

// Typical toxin cloud particle type
global.Particle1 = part_type_create();
part_type_shape(global.Particle1,pt_shape_pixel);            //This defines the particles shape
part_type_size(global.Particle1,.4,5,-0.01,0);                    //This is for the size
part_type_scale(global.Particle1,1,1);                       //This is for scaling
part_type_color1(global.Particle1,c_green);                  //This sets its colour. There are three different codes for this
part_type_alpha2(global.Particle1,1, 0.75);                        //This is its alpha. There are three different codes for this
part_type_speed(global.Particle1,0,.1,-.01,.15);            //The particles speed
part_type_direction(global.Particle1,0,359,0,20);            //The direction
part_type_orientation(global.Particle1,0,0,0,0,0);           //This changes the rotation of the particle
part_type_blend(global.Particle1,true);                         //This is the blend mode, either additive or normal
part_type_life(global.Particle1,10,50);                       //This is its lifespan in steps
