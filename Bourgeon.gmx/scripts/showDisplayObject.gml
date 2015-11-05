var xPos = argument[0];
var yPos = argument[1];
var sprite = argument[2];
var timeout = argument[3];

var keyToExit = vk_nokey;
if(argument_count > 4)
{
    keyToExit = argument[4];
}

var tintColor = -1;
if(argument_count > 5)
{
    tintColor = argument[5];
}

displayobj = instance_create(xPos, yPos, obj_displayobject);
if(!is_undefined(displayobj) && instance_exists(displayobj))
{
    displayobj.x = xPos;
    displayobj.y = yPos;
    displayobj.sprite_index = sprite;
    displayobj.keyToExit = keyToExit;
    displayobj.timeout = timeout;
    if(tintColor != -1)
    {
        displayobj.image_blend = tintColor;
    }
}
