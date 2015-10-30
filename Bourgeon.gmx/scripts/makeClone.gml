var cell, _x, _y, isMutated

cell = argument0 //The cell to be cloned
_x = argument1  //The coordinates where the clone should be placed
_y = argument2
isMutated = argument3 //Whether the clone should be slightly mutated

var cellType;
if(cell.isPlayer)
{
    if(global.twoPlayersActive)
    {
        cellType = obj_cell;
    }
    else
    {
        cellType = obj_player;
        global.paused = true;
    }
}
else
{
    cellType = obj_cell;
}
newCell = instance_create(_x, _y, cellType);

//Set all of the new cell's values to the same as the old cell's
newCell.scaleFactor = cell.scaleFactor;
//Set the image size to the minimum for the cell's scaleFactor
newCell.image_xscale = cell.scaleFactor* 0.30; 
newCell.image_yscale = cell.scaleFactor* 0.30;

newCell.maxHealth = cell.maxHealth;
newCell.cellHealth = cell.maxHealth;

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

if(isMutated) //If the clone should be mutated, change it's values
{
    rand = irandom(8) //Random integer to determine number of mutations
    if(rand <5)//55% chance for a single mutation (5/9)
        numMutations =1
    else if(rand<7)//22% chance for two mutations(2/9)
        numMutations = 2
    else if (rand==7)//11% chance for three mutations(1/9)
        numMutations = 3
    else //11% chance for four mutations (1/9) One mutation will be negative
        numMutations = 4
        
    for(var i = 0; i<numMutations; i++)
    {
        traitNum = irandom(9) //Number for the trait that will be changed
        switch(traitNum)
        {
            case 0: //Change in size
                if(i!=3){//Size increase
                    if(newCell.scaleFactor<2)//If less than max
                        newCell.scaleFactor += 0.25
                }
                else{//Size Decrease
                    if(newCell.scaleFactor>0.5)//If more than min
                        newCell.scaleFactor -= 0.25
                }
                //Visual size is not changed because this would 
                //give one of the new cells an advantage
                break;
            case 1: //Change in health
                if(i!=3){//Increase
                    if(newCell.maxHealth<=280){//If won't increase past max
                        newCell.maxHealth +=20
                        newCell.cellHealth = newCell.maxHealth
                    }
                }
                else if(newCell.maxHealth>=70){ //Decrease if won't decrease past min
                    newCell.maxHealth -=20
                    newCell.cellHealth = newCell.maxHealth
                }
                break;
            case 2: //Random color change
                newCell.image_blend = random(c_white)
                break;
            case 3: //Change in temperature tolerance
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
            case 4://Change in vision
                if(i!=3){
                    if(newCell.visionLevel<=0.85)
                        newCell.visionLevel+=0.15
                }
                else{
                    if(newCell.visionLevel>=0.65)
                        newCell.visionLevel-=0.15
                }
                break;
            case 5: //Change in ability to engulf cells
                if(i!=3){
                    if(irandom(3)==0) //25% chance of giving trait
                        newCell.canPhagocytosis = true;
                }
                else{
                    if(irandom(2)==0) //33% chance of losing trait
                        newCell.canPhagocytosis = false;
                }
                break;
            case 6: //Change in ciliaLevel
                if(i!=3){
                    if(newCell.ciliaLevel<3)
                        newCell.ciliaLevel+=1
                }
                else if(newCell.ciliaLevel>0)
                    newCell.ciliaLevel-=1;
                break;
            case 7: //Change in flagellaLevel
                if(i!=3){
                    if(newCell.flagellaLevel<3)
                        newCell.flagellaLevel+=1
                }
                else if(newCell.flagellaLevel>0){
                    newCell.flagellaLevel-=1;
                }
                break;
            case 8: //Change in edible particles
                var toChange; //Array of particle types that can be changed
                toChange[] = 0   
                var k = 0;
                for(var j = 0; j< array_length_1d(global.particles); j++){
                    if(i!=3&&!newCell.canConsumeParticle[j]){//Add currently inactive particles
                        toChange[k] = j
                        k++;
                    }
                    else if(newCell.canConsumeParticle[j])//Add active particles
                    {
                        toChange[k] = j
                        k++;
                    }
                }
                
                var numChangeable =array_length_1d(toChange)
                //If there are no inactive particles, no positive change can be made
                //If there is not at least two inactive, no negative change can be made
                if((numChangeable>0&&i!=3)||(numChangeable>1)){
                    var index =irandom(numChangeable-1);//Choose a random changeable particle type
                    newCell.canConsumeParticle[toChange[index]] = !newCell.canConsumeParticle[toChange[index]]
                    //Invert whether the particle type is active
                }
                break;
                
            case 9: //Change in chemical immunities
                var toChange;//Array of immunities that can be changed
                toChange[] = 0   
                var k = 0;
                for(var j = 0; j< array_length_1d(global.chemicals); j++){
                    if(i!=3&&!newCell.isResistantToChemical[j]){//Add currently inactive immunities
                        toChange[k] = j
                        k++;
                    }
                    else if(newCell.isResistantToChemical[j])//Add currently active immunities
                    {
                        toChange[k] = j
                        k++;
                    }
                }
                
                var numChangeable =array_length_1d(toChange)
                //If there are no inactive immunities, no positive change can be made
                //If there is not at least two inactive, no negative change can be made
                if((numChangeable>0&&i!=3)||(numChangeable>1)){
                    var index =irandom(numChangeable-1);
                    newCell.isResistantToChemical[toChange[index]] = !newCell.isResistantToChemical[toChange[index]]
                }
                
                        
                
        }
    }
}
//Update cell speed and max size to adjust for mutations
newCell.cellSpeed = (newCell.flagellaLevel +newCell.ciliaLevel)+2*(2-newCell.scaleFactor)+1
newCell.speed = newCell.cellSpeed
newCell.maxHeight = newCell.sprite_height*newCell.scaleFactor * 0.30*2;
newCell.maxWidth = newCell.sprite_width*newCell.scaleFactor * 0.30*2;

return newCell


