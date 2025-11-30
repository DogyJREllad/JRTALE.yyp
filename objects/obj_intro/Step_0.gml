var obj = instance_nearest(0, 0, obj_textStuff);

var text = [
"Long ago, two races ruled over Earth. HUMANS and MONSTERS",
"One day, a war broke between the two races.",
"After a long battle, the humans were victorious.",
"They sealed the monsters underground with a magic spell.",
"Many years later...",
"MT. EBOTT 20XX",
"A little dog wanted to visited the cave to see if the monsters were still alive",
"He kept searching until...",
"...",
"...oh",
"Fuck",
"20YY...",
"3 dumbasses also searched the cave because of a tiktok trend",
"...",
"...it was clickbait",
"R.I.P"
]

var delta = delta_time / 1000000;

if(image_alpha > 1)
{
	image_alpha = 1;	
}
if(obj.completed)
{
	introTime += delta;
}

if(introTime >= waitTime)
{
	next = true;
}

if(keyboard_check(ord("Z")))
{
	next = true;
	skipped = true;
}

if(next)
{
	image_alpha -= 2 * delta;
	
	if(image_alpha <= 0)
	{
		if(image_index <= 14 and !skipped)
		{
			image_index++;
			show_debug_message(text[image_index]);
			introTime = 0;
			next = false;
			increaseAlpha = true;
		}else
		{
			room_goto(roomSelect);
		}
	}	
}

if(image_index == 9 or image_index == 10)
{
	pitch -= delta / 4;
}else
{
	pitch += delta / 4;
}

if(pitch < 0)
{
	pitch = 0;
}else if(pitch > 1)
{
	pitch = 1;
}

audio_sound_pitch(mus_opening, pitch);

//show_debug_message(introTime);
//show_debug_message(image_alpha);
//show_debug_message(next);
//show_debug_message(increaseAlpha);

if(increaseAlpha)
{
	if(image_alpha < 1)
	{
		image_alpha += 2 * delta;
	}else
	{
		increaseAlpha = false;
	}
}

if(image_index != 9 and image_index != 14)
{
	obj.switchText(text[image_index]);
}else
{
	obj.switchText(text[image_index], 3);	
}


