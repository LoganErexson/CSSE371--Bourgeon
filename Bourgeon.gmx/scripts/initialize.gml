// Randomize the seed!
randomize();

// Setup chemical and corresponding color arrays
globalvar chemicals, chemcolors;

global.chemicals[0] = "NaCl (Salt)";
global.chemcolors[0] = c_white;

global.chemicals[1] = "Nitrogen";
global.chemcolors[1] = c_yellow;

global.chemicals[2] = "Ethanol";
global.chemcolors[2] = c_lime;

// Setup particle systems and particle types
script_execute(setupParticles);
