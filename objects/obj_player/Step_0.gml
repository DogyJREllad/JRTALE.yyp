var delta = delta_time / 30000;
//show_debug_message(delta);
var xSpeed = 0;
var ySpeed = 0;

var prev_x = x;
var prev_y = y;

var stuck = false;

collisionSpeed = activeSpeed + 10;

if(keyboard_check(ord("X")) and canRun)
{
	activeSpeed = runSpeed;
}else
{
	activeSpeed = walkSpeed;
}

if(keyboard_check(vk_left) and place_free(x - collisionSpeed, y))
{
	xSpeed = -activeSpeed;
}else if(keyboard_check(vk_right) and place_free(x + collisionSpeed, y))
{
	xSpeed = activeSpeed;
}

if(keyboard_check(vk_up) and place_free(x, y - collisionSpeed))
{
	ySpeed = -activeSpeed;
}else if(keyboard_check(vk_down) and place_free(x, y + collisionSpeed))
{
	ySpeed = activeSpeed;
}

/*if((!place_free(x, y + collisionSpeed) and !place_free(x, y - collisionSpeed)) or (!place_free(x - collisionSpeed, y) and !place_free(x + collisionSpeed, y)))
{
	stuck = true;	
}*/

if(!keyboard_check(vk_right) and !keyboard_check(vk_left) and !keyboard_check(vk_up) and !keyboard_check(vk_down) and image_index != 0)
{
		image_index = 0;
}

/*if(stuck)
{
	xSpeed = walkSpeed;
	ySpeed = walkSpeed;
		
	if(allowedToCheck)
	{
		if(prev_x = x)
		{
			xSpeed = -walkSpeed;
		}
	
		if(prev_y = y)
		{
			ySpeed = -walkSpeed;
		}
	}else
	{
		allowedToCheck = true;	
	}
}else
{
	allowedToCheck = false;
}*/

x += xSpeed * delta;
y += ySpeed * delta;

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

//show_debug_message(mask_index);
//show_debug_message(sprite_index);
//show_debug_message(mask_index == spr_hitboxMirrored and sprite_index != spriteSideways);

if(image_xscale < 0)
{
	sprite_set_offset(spriteSideways, mirrorOffset, 0);
}else
{
	sprite_set_offset(spriteSideways, 0, 0);
}

//STOLEN CODE ALERT
viewRatio = window_get_width() / window_get_height();
calculatedWidth = preferredHeight * viewRatio;

camera_set_view_pos(view_camera[0], x - calculatedWidth / 2, y - preferredHeight / 2);

//image_alpha = 0.5;

//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);

image_speed = activeSpeed / animPercent;