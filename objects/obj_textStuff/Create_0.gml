function switchText(newText, startingIndex = 1)
{
	if(fullText != newText)
	{
		fullText = newText;
		var startingText = "";
		for(var int = 1; int < startingIndex; int += 1)
		{
			startingText += string_char_at(fullText, int);
		}
		text = startingText;
		i = startingIndex;
		completed = false;
	}
}