// Randomize the seed!
randomize();

// Setup chemical and corresponding color arrays
globalvar chemicals, chemcolors;

chemicals[0] = "Salt";
chemcolors[0] = c_white;

chemicals[1] = "Nitrogen";
chemcolors[1] = c_yellow;

// Setup particle systems and particle types
script_execute(setupParticles);
