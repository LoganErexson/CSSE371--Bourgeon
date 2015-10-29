var xPos = argument[0];
var yPos = argument[1];
var message = argument[2];
var lineHeight = argument[3];
var stepsToTimeout = argument[4];
var drawPriority = 1; // Bigger numbers mean the box is drawn sooner
if(argument_count > 5)
{
    drawPriority = argument[5]; // Optional arg
}

msgbox = instance_create(xPos, yPos, obj_messagebox);
msgbox.image_yscale *= (lineHeight/11);
msgbox.text = message;
msgbox.timeout = stepsToTimeout;
msgbox.depth = -1*drawPriority;
