/// instance_furthest_range( x, y, self, radius );
///
/// Finds the furthest instance from the x and y coordinate within the given radius

var _x, _y, _radius, _inst, _cell_list, _cloud_list;
_particle_list[] =0

_x = argument0;
_y = argument1;
_self = argument2;
_radius = argument3;
_inst = noone;

// First, make a list of all instances of each type
var j =0;
for (var i = 0; i < instance_number(obj_cell); i++ )
{
    _next_cell = instance_find(obj_cell, i);
    _distance = point_distance(_next_cell.x, _next_cell.y, _x, _y)
    if(_distance > _radius)
    {
        _cell_list[j] = _next_cell
        j++
    }
}

j =0
for (var i = 0; i < instance_number(obj_particle); i++ )
{
    _next_particle = instance_find(obj_particle, i);
    _distance = point_distance(_next_particle.x, _next_particle.y, _x, _y)
    if(_distance > _radius && _self.canConsumeParticle[_next_particle.parttype])
    {
        _particle_list[j] = _next_particle
        j++
    }
}

j=0
for (var i = 0; i < instance_number(obj_chemcloud); i++ )
{
    _next_cloud = instance_find(obj_chemcloud, i);
    _distance = point_distance(_next_cloud.x, _next_cloud.y, _x, _y)
    if(_distance > _radius && !self.isResistantToChemical[_next_cloud.chemtype])
    {
        _cloud_list[j] = _next_cloud
        j++
    }
}

_maxVal = 0;
_maxIndex=0;
_directions[15] = 0;
_directions[0] = 0; _directions[1] = 30; _directions[2] = 45; _directions[3] = 60; _directions[4] =90; _directions[5] = 120;
_directions[6] = 135; _directions[7] = 150; _directions[8] = 180; _directions[9] = 210; _directions[10] = 225; _directions[11] = 240; 
_directions[12] = 270; _directions[13] = 300; _directions[14] = 315; _directions[15] = 330; 
_dirValues[15] = 0;


for (var i = 0; i <array_length_1d(_cell_list); i++ )
{
    _distance = point_distance(_cell_list[i].x, _cell_list[i].y, _self.x, _self.y)
    
    for(var j = 0; j < array_length_1d(_directions); j++)
    {
        _newX = _x + _self.speed*cos(_directions[j])
        _newY = _y + _self.speed*sin(_directions[j])
        _newDistance= point_distance(_cell_list[i].x, _cell_list[i].y, _self.x, _self.y)
        if((_self.scaleFactor - _cell_list[i].scaleFactor)>0){
            _dirValues[j] += (_distance-_newDistance)
        }
        else{
            _dirValues[j] += (_newDistance-_distance)
        }
    }
}
for (var i = 0; i <array_length_1d(_particle_list); i++ )
{
    _distance = point_distance(_particle_list[i].x, _particle_list[i].y, _x, _y)
    
    for(var j = 0; j < array_length_1d(_directions); j++)
    {
        _newX = _x + _self.speed*cos(_directions[j])
        _newY = _y + _self.speed*sin(_directions[j])
        _newDistance= point_distance(_particle_list[i].x, _particle_list[i].y, _self.x, _self.y)
        _dirValues[j] += (_distance-_newDistance)

    }
}


for (var i = 0; i <array_length_1d(_cloud_list); i++ )
{
    _distance = point_distance(_cloud_list[i].x, _cloud_list[i].y, _x, _y)+ _cloud_list[i].clouddiameter/2
    
    for(var j = 0; j < array_length_1d(_directions); j++)
    {
        _newX = _x + _self.speed*cos(_directions[j])
        _newY = _y + _self.speed*sin(_directions[j])
        _newDistance= point_distance(_cloud_list[i].x, _cloud_list[i].y, _self.x, _self.y)
        
        _dirValues[j] += (_newDistance-_distance)
    }
}


maxValue = -99999999
maxDirections[]=0;
j =0;
for(i = 0; i<array_length_1d(_directions); i++)
{
    if(_dirValues[i]==maxValue)
    {
        maxDirections[j] = i
        j++
    }   
    else if(_dirValues[i]>maxValue)
    {
        maxDirections=0
        maxDirections[0] = _dirValues[i]
        j= 1
        maxValue = _dirValues[i]
    }
}
if(array_length_1d(maxDirections)>0){
    _inst = maxDirections[irandom(array_length_1d(maxDirections)-1)]
    // And return the value
    return _inst;
}
return _directions[irandom(array_length_1d(_directions))]
