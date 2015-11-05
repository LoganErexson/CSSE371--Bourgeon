var xPos = argument[0];
var yPos = argument[1];
var message = argument[2];
var lineHeight = argument[3];
var stepsToTimeout = argument[4];

var keyToPressToClose = vk_nokey;
if(argument_count > 5)
{
    keyToPressToClose = argument[5];
}

var drawPriority = 2; // Bigger numbers mean the box takes priority
if(argument_count > 6)
{
    drawPriority = argument[6]; // Optional arg
}

msgbox = instance_create(xPos, yPos, obj_messagebox);
if(!is_undefined(msgbox) && instance_exists(msgbox))
{
    msgbox.image_yscale *= (lineHeight/11);
    msgbox.text = message;
    msgbox.timeout = stepsToTimeout;
    msgbox.depth = -1*drawPriority;
    msgbox.keyToExit = keyToPressToClose;
}
