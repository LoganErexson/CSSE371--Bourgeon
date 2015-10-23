// Generate chemical clouds
var max_clouds = 10;
var min_clouds = 10;
var num_clouds = random(max_clouds - min_clouds) + min_clouds;
var i;
for(i = 0; i<num_clouds; i++)
{
    instance_create(random(room_width), random(room_height), obj_chemcloud);
}

// Generate particles
var max_particles = 100;
var min_particles = 50;
var num_particles = random(max_particles - min_particles) + min_particles;
var i;
for(i = 0; i<num_particles; i++)
{
    instance_create(random(room_width), random(room_height), obj_particle);
}

// Generate other cells
var max_cells = 15;
var min_cells = 7;
var num_cells = random(max_cells - min_cells) + min_cells;
var i;
for(i = 0; i<num_cells; i++)
{
    instance_create(random(room_width), random(room_height), obj_cell);
}
