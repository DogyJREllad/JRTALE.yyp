var delta = delta_time / 1000000;

if(!completed)
{
	time += delta;
	
	if(string_char_at(fullText, i - 1) == ".")
	{
		waitTime = 0.5 * speedMultiplier;
	
		if(time >= waitTime)
		{
			text += string_char_at(fullText, i);
			audio_play_sound(sound, 10, false);
			if(i != string_length(fullText))
			{
				i++;
				time = 0;
			}else
			{
				completed = true;	
			}
		}
	}else if(string_char_at(fullText, i - 1) == ",")
	{
		waitTime = 0.3 * speedMultiplier;
	
		if(time >= waitTime)
		{
			text += string_char_at(fullText, i);
			audio_play_sound(sound, 10, false);
			if(i != string_length(fullText))
			{
				i++;
				time = 0;
			}else
			{
				completed = true;	
			}
		}
	}else if(string_char_at(fullText, i) == " ")
	{	
		waitTime = 0.1 * speedMultiplier;
	
		if(time >= waitTime)
		{
			text += string_char_at(fullText, i);
			if(i != string_length(fullText))
			{
				i++;
				time = 0;
			}else
			{
				completed = true;	
			}
		}
	}else
	{
		waitTime = 0.1 * speedMultiplier;
	
		if(time >= waitTime)
		{
			text += string_char_at(fullText, i);
			audio_play_sound(sound, 10, false);
			if(i != string_length(fullText))
			{
				i++;
				time = 0;
			}else
			{
				completed = true;	
			}
		}
	}
}