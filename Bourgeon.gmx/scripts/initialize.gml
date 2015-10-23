// Randomize the seed!
randomize();

// Setup chemical and corresponding color arrays
globalvar chemicals, chemcolors, particles, partcolors;

global.chemicals[0] = "NaCl";
global.chemcolors[0] = c_white;

global.chemicals[1] = "Nitrogen";
global.chemcolors[1] = c_yellow;

global.chemicals[2] = "Ethanol";
global.chemcolors[2] = c_lime;

global.chemical[3] = "KCL";
global.chemcolors[3] = c_orange;

global.chemical[4] = "triethylene glycol";
global.chemical[4] = c_aqua;

// Add more chemicals as needed....
// global.chemicals[i] = "Chemical Name";
// global.chemcolors[i] = chemical_color;


// Setup particle systems and particle types
script_execute(setupParticles);
