// Randomize the seed!
randomize();

globalvar controller;

globalvar paused;
global.paused = false;

globalvar messageShowing;
global.messageShowing = false;

// Setup general global variables
globalvar playerIsAlive;            // Whether or not the player lives
global.playerIsAlive = false;

globalvar twoPlayersActive;
global.twoPlayersActive = false;

globalvar numParticles;
global.numParticles = 0;

// Setup chemical and corresponding color array
globalvar chemicals, chemcolors, chemMessageShown;

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
globalvar particles, partcolors, partMessageShown;

global.particles[0] = "ATP";
global.partcolors[0] = $F82C07;

global.particles[1] = "Glucose";
global.partcolors[1] = c_white;

global.particles[2] = "Alanine";
global.partcolors[2] = $C5FED9;

global.particles[3] = "Arginine";
global.partcolors[3] = $FEDE01;

global.particles[4] = "Asparagine";
global.partcolors[4] = $00BE3F;

global.particles[5] = "Cysteine";
global.partcolors[5] = $9C9CFF;

global.particles[6] = "Glutamine";
global.partcolors[6] = $FF6666;

global.particles[7] = "Glycine";
global.partcolors[7] = $FFC041;

global.particles[8] = "Histidine";
global.partcolors[8] = $F6F600;

global.particles[9] = "Isoleucine";
global.partcolors[9] = $00E3E3;

global.particles[10] = "Leucine";
global.partcolors[10] = $E3E300;

global.particles[11] = "Lysine";
global.partcolors[11] = $990099;

global.particles[12] = "Methionine";
global.partcolors[12] = $CC00CC;

global.particles[13] = "Phenylalanine";
global.partcolors[13] = $A274FF;

global.particles[14] = "Proline";
global.partcolors[14] = $E68A00;

global.particles[15] = "Serine";
global.partcolors[15] = $8533FF;

global.particles[16] = "Threonine";
global.partcolors[16] = $ABABAB;

global.particles[17] = "Tryptophan";
global.partcolors[17] = $E4621B;

global.particles[18] = "Tyrosine";
global.partcolors[18] = $F14F7C;

global.particles[19] = "Valine";
global.partcolors[19] = $F14F7C;


var i;
for(i=0; i<array_length_1d(global.particles); i++) // generate array for food particle messages so they are not displayed multiple times
{
    global.partMessageShown[i] = false;
}
for(i=0; i<array_length_1d(global.chemicals); i++) // generate array for chem cloud messages so they are not displayed multiple times
{
    global.chemMessageShown[i] = false;
}

// Add more particles as needed....
// global.particles[i] = "Particle Name";
// global.partcolor[i] = particle_color;


// Setup particle systems and particle types
script_execute(setupParticles);
