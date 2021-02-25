obj_card.image_index = 0;
currentFlippedCards = 0;

var corr = correct;
with (obj_card)
{
	if (flipped)
	{
		if (corr)
		{
			audio_play_sound(snd_correct,5,false);
			instance_destroy();
			repeat (4)
			{
				instance_create_layer(x,y, "Icons", obj_glint);
			}
		}
		else
		{
			flipped = false;
			audio_play_sound(snd_incorrect,5,false);
		}
	}
	clickable = true;
}

if (corr)
{
	remainingCards -= flippedCardLimit;

	if (remainingCards <= 0)
	{
		room_goto_next();
	}
}