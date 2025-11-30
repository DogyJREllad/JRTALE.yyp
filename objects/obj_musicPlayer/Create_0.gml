allAudio = [
mus_opening,
mus_killedAll
]

playMusic(musicIndex);

function playMusic(index, loops = true)
{
	try
	{
		if(!audio_is_playing(allAudio[index]))
		{
			for(var int = 0; int < array_length(allAudio); int += 1)
			{
				audio_stop_sound(allAudio[int]);
			}
	
			audio_play_sound(allAudio[index], 10, loops);
		
	}
	}catch(e)
	{
		for(var int = 0; int < array_length(allAudio); int += 1)
		{
			audio_stop_sound(allAudio[int]);
		}
			
		show_debug_message(e);
	}
}

function stopAllMusic()
{
	for(var int = 0; int < array_length(allAudio); int += 1)
	{
		audio_stop_sound(allAudio[int]);
	}
}