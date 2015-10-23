/// instance_furthest_range( x, y, self, radius );
///
/// Finds the furthest instance from the x and y coordinate within the given radius

var _x, _y, _radius, _inst, _cell_list, _particle_list, _cloud_list;

_x = argument0;
_y = argument1;
_self = argument2;
_radius = argument3;
_inst = noone;

// First, make a list of all instances of each type
for (var i = 0; i < instance_number(obj_cell); i++ )
    _cell_list[i] = instance_find(obj_cell, i);
    
for (var i = 0; i < instance_number(obj_particle); i++ )
    _particle_list[i] = instance_find(obj_particle, i);

for (var i = 0; i < instance_number(obj_chemcloud); i++ )
    _cloud_list[i] = instance_find(obj_chemcloud, i);

_maxVal = 0;
_maxIndex=0;
_maxArray =0;

for (var i = 0; i <array_length_1d(_cell_list); i++ )
{
    _distance = point_distance(_cell_list[i].x, _cell_list[i].y, _x, _y)
    if (_cell_list[i] && _distance > _radius)
    {
        if((_self.scaleFactor - _cell_list[i].scaleFactor)>0){
            _currentVal = _distance*1000*_cell_list[i].scaleFactor
        }
        else{
            _currentVal = -_distance*5000
        }
        if(abs(_maxVal)<abs(_currentVal))
        {
            _maxVal = _currentVal;
            _maxIndex = i;
            _maxArray = 0;
        }
    }
}
for (var i = 0; i <array_length_1d(_particle_list); i++ )
{
    _distance = point_distance(_particle_list[i].x, _particle_list[i].y, _x, _y)
    if (_particle_list[i] && _distance > _radius && _self.canConsumeParticle[_particle_list[i].parttype])
    {
        _currentVal = _distance*100
        
        if(abs(_maxVal)<_currentVal)
        {
            _maxVal = _currentVal;
            _maxIndex = i;
            _maxArray = 1;
        }
    }
}
for (var i = 0; i <array_length_1d(_cloud_list); i++ )
{
    _distance = point_distance(_cloud_list[i].x, _cloud_list[i].y, _x, _y)+ _cloud_list[i].clouddiameter/2
    if (_cloud_list[i] && _distance > _radius && !isResistantToChemical[_cloud_list[i].chemtype])
    {
        _currentVal = -_distance*1000
        
        if(abs(_maxVal)<abs(_currentVal))
        {
            _maxVal = _currentVal;
            _maxIndex = i;
            _maxArray = 2;
        }
    }
}

if(_maxArray ==0)
    _inst[0] = _cell_list[_maxIndex]
else if(_maxArray == 1)
    _inst[0] = _particle_list[_maxIndex]
else
    _inst[0] = _cloud_list[_maxIndex]
    
_inst[1] = _maxVal
// And return the value
return _inst;
