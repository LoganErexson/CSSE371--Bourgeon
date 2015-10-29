var cell, _x, _y, isMutated

cell = argument0
_x = argument1
_y = argument2
isMutated = argument3


newCell = instance_create(_x, _y, obj_cell);

newCell.temperature = cell.temperature;
newCell.scaleFactor = cell.scaleFactor;
newCell.image_xscale = cell.image_xscale;
newCell.image_yscale = cell.image_yscale;
newCell.maxHeight = cell.maxHeight;
newCell.maxWidth = cell.maxWidth;

newCell.maxHealth = cell.maxHealth;
newCell.cellHealth = cell.cellHealth;

newCell.image_blend = cell.image_blend;
newCell.maxTemp = cell.maxTemp;
newCell.minTemp = cell.minTemp;

newCell.visionLevel = cell.visionLevel
newCell.canPhagocytosis = cell.canPhagocytosis
newCell.ciliaLevel = cell.ciliaLevel
newCell.flagellaLevel = cell.flagellaLevel
newCell.cellSpeed = cell.cellSpeed
newCell.speed = cell.speed



return newCell


