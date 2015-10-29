/// instance_furthest_range( x, y, self, radius );
///
/// Finds the furthest instance from the x and y coordinate within the given radius

var _cell, _turnSize, _radius, _inst ;
_cell_list[] = 0
_cloud_list[] = 0;
_particle_list[] =0

_cell = argument0;
_turnSize = argument1;
_radius = argument2;
_inst = noone;

// First, make a list of all instances of each type
var j =0;
if(_cell.canPhagocytosis)
{
    for (var i = 0; i < instance_number(obj_cell); i++ )
    {
        _next_cell = instance_find(obj_cell, i);
        _distance = point_distance(_next_cell.x, _next_cell.y, _cell.x, _cell.y)
        if(_distance <= _radius && _distance!=0)
        {
            _cell_list[j] = _next_cell
            j++
        }
    }
    
}

j =0
for (var i = 0; i < instance_number(obj_particle); i++ )
{
    _next_particle = instance_find(obj_particle, i);
    part_type = global.particles[_next_particle.parttype]
    _distance = point_distance(_next_particle.x, _next_particle.y, _cell.x, _cell.y)
    if(_distance <= _radius && _cell.canConsumeParticle[_next_particle.parttype])
    {
        _particle_list[j] = _next_particle
        j++
    }
}

j=0
for (var i = 0; i < instance_number(obj_chemcloud); i++ )
{
    _next_cloud = instance_find(obj_chemcloud, i);
    _distance = point_distance(_next_cloud.x, _next_cloud.y, _cell.x, _cell.y)
    if(_distance <= (_radius+_next_cloud.clouddiameter/2) && !_cell.isResistantToChemical[_next_cloud.chemtype])
    {
        _cloud_list[j] = _next_cloud
        j++
    }
}

_directions[15] = 0;
_directions[0] = 0; _directions[1] = pi/6; _directions[2] = pi/4; _directions[3] = pi/3; _directions[4] =pi/2; _directions[5] = 2*pi/3;
_directions[6] = 3*pi/4; _directions[7] = 5*pi/6; _directions[8] = pi; _directions[9] = 7*pi/6; _directions[10] = 5*pi/4; _directions[11] = 4*pi/3; 
_directions[12] = 3*pi/2; _directions[13] = 5*pi/3; _directions[14] = 7*pi/4; _directions[15] = 11*pi/6; 
var _dirValues;
_dirValues[15] = 0;


for (var i = 0; i <array_length_1d(_cell_list); i++ )
{
    _distance = point_distance(_cell_list[i].x, _cell_list[i].y, _cell.x, _cell.y)
    
    for(var j = 0; j < array_length_1d(_directions); j++)
    {
        _newX = _cell.x + _cell.speed*_turnSize*cos(_directions[j])
        _newY = _cell.y + _cell.speed*_turnSize*sin(_directions[j])
        _newDistance= point_distance(_cell_list[i].x, _cell_list[i].y, _newX, _newY)
        if((_cell.image_xscale - _cell_list[i].image_xscale)>0){
            _dirValues[j] += 3*(_distance-_newDistance)
        }
        else{
            _dirValues[j] += 3*(_newDistance-_distance)
        }
        if(_newDistance<3*_radius/4)
        {
            if(_newDistance<_radius/2)
            {
                if(_newDistance<_radius/3)
                {
                    _dirValues[j] += 4*_dirValues[j]
                }
                else
                    _dirValues[j] += 3*_dirValues[j]
            }
            else
                _dirValues[j] += 2*_dirValues[j]
        }
        
    }
}

for (var i = 0; i <array_length_1d(_particle_list); i++ )
{
    _distance = point_distance(_particle_list[i].x, _particle_list[i].y, _cell.x, _cell.y)
    
    for(var j = 0; j < array_length_1d(_directions); j++)
    {
        _newX = _cell.x + _cell.speed*_turnSize*cos(_directions[j])
        _newY = _cell.y + _cell.speed*_turnSize*sin(_directions[j])
        _newDistance= point_distance(_particle_list[i].x, _particle_list[i].y, _newX, _newY)
        if(_newDistance<3*_radius/4)
        {
            if(_newDistance<_radius/2)
            {
                if(_newDistance<_radius/3)
                {
                    _dirValues[j] += 4*(_distance-_newDistance)
                }
                else
                    _dirValues[j] += 3*(_distance-_newDistance)
            }
            else
                _dirValues[j] += 2*(_distance-_newDistance)
        }
        else
        {
            _dirValues[j] += (_distance-_newDistance)
        }
        

    }
}


for (var i = 0; i <array_length_1d(_cloud_list); i++ )
{
    _distance = point_distance(_cloud_list[i].x, _cloud_list[i].y, _cell.x, _cell.y)+ _cloud_list[i].clouddiameter/2
    
    for(var j = 0; j < array_length_1d(_directions); j++)
    {
        _newX = _cell.x + _cell.speed*_turnSize*cos(_directions[j])
        _newY = _cell.y + _cell.speed*_turnSize*sin(_directions[j])
        _newDistance= point_distance(_cloud_list[i].x, _cloud_list[i].y, _newX, _newY)
        
        if(_newDistance<3*_radius/4)
        {
            if(_newDistance<_radius/2)
            {
                if(_newDistance<_radius/3)
                {
                    _dirValues[j] += 12*(_newDistance-_distance)
                }
                else
                {
                    _dirValues[j] += 9*(_newDistance-_distance)
                }
            }
            else
            {
                _dirValues[j] += 6*(_newDistance-_distance)
            }
        }
        else
        {
            _dirValues[j] += 3*(_newDistance-_distance)
        }
    }
}


maxValue = -99999999
maxDirections[]=0;
j =0;
for(i = 0; i<array_length_1d(_directions); i++)
{
    if(_dirValues[i]==maxValue)
    {
        maxDirections[j] = _directions[i]
        j++
    }   
    else if(_dirValues[i]>maxValue)
    {
        maxDirections=0
        maxDirections[0] = _directions[i]
        j= 1
        maxValue = _dirValues[i]
    }
}
if(array_length_1d(maxDirections)>0&&array_length_1d(maxDirections)<16){
    _inst = maxDirections[irandom(array_length_1d(maxDirections)-1)]
    // And return the value
    return -_inst*180/pi
}
return _directions[irandom(array_length_1d(_directions)-1)]
