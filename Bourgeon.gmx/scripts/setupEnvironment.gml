// Generate chemical clouds
var max_clouds = 10;
var min_clouds = 10;
var num_clouds = random(max_clouds - min_clouds) + min_clouds;
var i;
for(i = 0; i<num_clouds; i++)
{
    instance_create(random(room_width), random(room_height), obj_chemcloud);
}

// TODO Generate other cells
