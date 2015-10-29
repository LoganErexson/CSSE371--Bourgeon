// Randomize the seed!
randomize();

// Setup general global variables
globalvar playerIsAlive;            // Whether or not the player lives
globalvar numParticles;
global.numParticles = 0;


// Setup chemical and corresponding color array
globalvar chemicals, chemcolors;

global.chemicals[0] = "NaCl";
global.chemcolors[0] = c_white;

global.chemicals[1] = "Nitrogen";
global.chemcolors[1] = c_yellow;

global.chemicals[2] = "Ethanol";
global.chemcolors[2] = c_lime;

global.chemicals[3] = "KCL";
global.chemcolors[3] = c_orange;

global.chemicals[4] = "Triethylene Glycol";
global.chemcolors[4] = c_aqua;

// Add more chemicals as needed....
// global.chemicals[i] = "Chemical Name";
// global.chemcolors[i] = chemical_color;


// Setup food particles and corresponding color array
globalvar particles, partcolors;

global.particles[0] = "Glucose";
global.partcolors[0] = c_white;

global.particles[1] = "Raw ATP";
global.partcolors[1] = c_green;

global.particles[2] = "Waste";
global.partcolors[2] = c_olive;

// Add more particles as needed....
// global.particles[i] = "Particle Name";
// global.partcolor[i] = particle_color;


// Setup particle systems and particle types
script_execute(setupParticles);
