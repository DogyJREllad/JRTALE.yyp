var delta = delta_time / 30000;
var xSpeed = 0;
var ySpeed = 0;

var prev_x = x;
var prev_y = y;



/*if(keyboard_check(ord("X")) and canRun)
{
	activeSpeed = runSpeed;
}else
{
	activeSpeed = walkSpeed;
}*/

if(x - followObject.x > maxRangeX)
{
	if(x - followObject.x > maxRangeX * (runSpeed/walkSpeed))
	{
		xSpeed = -runSpeed;	
	}else if(x - followObject.x < maxRangeX + walkSpeed)
	{
		xSpeed = -walkSpeed;
	}
}else if(x - followObject.x < -maxRangeX)
{
	if(x - followObject.x < -maxRangeX * (runSpeed/walkSpeed))
	{
		xSpeed = runSpeed;	
	}else if(x - followObject.x < -maxRangeX - walkSpeed)
	{
		xSpeed = walkSpeed;
	}
}

show_debug_message(x - followObject.x);
show_debug_message(y - followObject.y);

x += xSpeed * delta;
y += ySpeed * delta;

if(xSpeed == 0 and ySpeed == 0 and image_index != 0)
{
		image_index = 0;
}

if(abs(xSpeed) > 0 and ySpeed == 0)
{
	sprite_index = spriteSideways;
	
	if(xSpeed > 0)
	{
		image_xscale = abs(image_xscale);
		mask_index = spr_hitbox;
	}else if(xSpeed < 0)
	{
		image_xscale = -1 * abs(image_xscale);
		mask_index = spr_hitboxMirrored;
	}
}else if(ySpeed > 0 and xSpeed == 0)
{
	sprite_index = spriteBackwards;
	image_xscale = abs(image_xscale);
}else if(ySpeed < 0 and xSpeed == 0)
{
	sprite_index = spriteForwards;
	image_xscale = abs(image_xscale);
}

if(image_xscale < 0)
{
	sprite_set_offset(spriteSideways, mirrorOffset, 0);
}else
{
	sprite_set_offset(spriteSideways, 0, 0);
}

if(sprite_index == spriteBackwards and ySpeed < 0)
{
	sprite_index = spriteForwards;
}else if(sprite_index == spriteForwards and ySpeed > 0)
{
	sprite_index = spriteBackwards;
}else if(sprite_index == spriteSideways and image_xscale == abs(image_xscale) and xSpeed < 0)
{
	image_xscale = -1 * abs(image_xscale);
}else if(sprite_index == spriteSideways and image_xscale == -1 * abs(image_xscale) and xSpeed > 0)
{
	image_xscale = abs(image_xscale);
}

if(mask_index == spr_hitboxMirrored and image_xscale > 0)
{
	mask_index = spr_hitbox;	
}else if(mask_index == spr_hitbox and image_xscale < 0)
{
	mask_index = spr_hitboxMirrored;	
}

if(abs(xSpeed) > abs(ySpeed))
{
	image_speed = abs(xSpeed) / animPercent;
}else if(abs(xSpeed) < abs(ySpeed))
{
	image_speed = abs(ySpeed) / animPercent;
}else
{
	image_speed = abs(xSpeed) / animPercent;
}