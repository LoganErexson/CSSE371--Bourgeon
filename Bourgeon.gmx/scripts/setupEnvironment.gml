// Generate chemical clouds
var max_clouds = 10;
var min_clouds = 10;
var num_clouds = random(max_clouds - min_clouds) + min_clouds;
var i;

// Only call this function if the player is alive because of the line below!!
player = instance_find(obj_player, 0);

for(i = 0; i<num_clouds; i++)
{
    var xval = random(room_width);
    var yval = random(room_height);
    var cloud = instance_create(xval, yval, obj_chemcloud);
    
    var cloudradius = cloud.clouddiameter/2;
    if(point_distance(xval+(cloudradius), yval+(cloudradius), player.x, player.y) < cloudradius)
    {
        with(cloud)
        {
            instance_destroy();
        }
    }
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
    var xpos = random(room_width);
    var ypos = random(room_height);
    var cell = instance_create(xpos, ypos, obj_cell);

    if(point_distance(xpos, ypos, player.x, player.y) < 300*cell.visionLevel)
    {
        with(cell)
        {
            instance_destroy();
        }
    }
}
