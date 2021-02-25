if (!flipped && clickable)
{
	show_debug_message("Clicked card number "+string(cardID));
	
	flipped = true;
	var cID = cardID;
	image_index = cID;
	scaled = true;
	image_xscale = scalingAnimSize;
	image_yscale = scalingAnimSize;

	with (GameController)
	{
		checkCard = cID;
		event_perform(ev_other, ev_user0);
	}
}