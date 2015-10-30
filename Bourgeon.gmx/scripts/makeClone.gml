var cell, _x, _y, isMutated

cell = argument0
_x = argument1
_y = argument2
isMutated = argument3


newCell = instance_create(_x, _y, obj_cell);

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

newCell.canConsumeParticle = cell.canConsumeParticle
newCell.isResistantToChemical = cell.isResistantToChemical

if(isMutated)
{
    rand = irandom(8)
    if(rand <5)
        numMutations =1
    else if(rand<7)
        numMutations = 2
    else if (rand==7)
        numMutations = 3
    else 
        numMutations = 4
        
    for(var i = 0; i<numMutations; i++)
    {
        traitNum = irandom(9)
        switch(traitNum)
        {
            case 0:
                if(i!=3){
                    if(newCell.scaleFactor<2)
                        newCell.scaleFactor += 0.25
                }
                else{
                    if(newCell.scaleFactor>0.5)
                        newCell.scaleFactor -= 0.25
                }
                break;
            case 1:
                if(i!=3){
                    if(newCell.maxHealth<=280){
                        newCell.maxHealth +=20
                        newCell.cellHealth = newCell.maxHealth
                    }
                }
                else if(newCell.maxHealth>=70){
                    newCell.maxHealth -=20
                    newCell.cellHealth = newCell.maxHealth
                }
                break;
            case 2:
                newCell.image_blend = random(c_white)
                break;
            case 3:
                if(i!=3){
                    if(irandom(1))
                        newCell.maxTemp += 5
                    else
                        newCell.minTemp -= 5
                }
                else{
                    if(irandom(1))
                        newCell.maxTemp -= 5
                    else
                        newCell.minTemp += 5
                
                }
                break;
            case 4:
                if(i!=3){
                    if(newCell.visionLevel<=0.85)
                        newCell.visionLevel+=0.15
                }
                else{
                    if(newCell.visionLevel>=0.65)
                        newCell.visionLevel-=0.15
                }
                break;
            case 5:
                if(i!=3){
                    if(irandom(3)==0)
                        newCell.canPhagocytosis = true;
                }
                else{
                    if(irandom(2)==0)
                        newCell.canPhagocytosis = false;
                }
                break;
            case 6:
                if(i!=3){
                    if(newCell.ciliaLevel<3)
                        newCell.ciliaLevel+=1
                }
                else if(newCell.ciliaLevel>0)
                    newCell.ciliaLevel-=1;
                break;
            case 7:
                if(i!=3){
                    if(newCell.flagellaLevel<3)
                        newCell.flagellaLevel+=1
                }
                else if(newCell.flagellaLevel>0){
                    newCell.flagellaLevel-=1;
                }
                break;
            case 8:
                var toChange;
                toChange[] = 0   
                var k = 0;
                for(var j = 0; j< array_length_1d(global.particles); j++){
                    if(i!=3&&!newCell.canConsumeParticle[j]){
                        toChange[k] = j
                        k++;
                    }
                    else if(newCell.canConsumeParticle[j])
                    {
                        toChange[k] = j
                        k++;
                    }
                }
                
                var numChangeable =array_length_1d(toChange)
                if((numChangeable>0&&i!=3)||(numChangeable>1&&i==3)){
                    var index =irandom(numChangeable-1);
                    newCell.canConsumeParticle[toChange[index]] = !newCell.canConsumeParticle[toChange[index]]
                }
                break;
                
            case 9:
                var toChange;
                toChange[] = 0   
                var k = 0;
                for(var j = 0; j< array_length_1d(global.chemicals); j++){
                    if(i!=3&&!newCell.isResistantToChemical[j]){
                        toChange[k] = j
                        k++;
                    }
                    else if(newCell.isResistantToChemical[j])
                    {
                        toChange[k] = j
                        k++;
                    }
                }
                
                var numChangeable =array_length_1d(toChange)
                if((numChangeable>0&&i!=3)||(numChangeable>1)){
                    var index =irandom(numChangeable-1);
                    newCell.isResistantToChemical[toChange[index]] = !newCell.isResistantToChemical[toChange[index]]
                }
                
                        
                
        }
    }
}
newCell.cellSpeed = (newCell.flagellaLevel +newCell.ciliaLevel)+2*(2-newCell.scaleFactor)+1
newCell.speed = newCell.cellSpeed

return newCell


