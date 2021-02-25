switch (showInformation)
{
	case -1: exit;
	case 0: draw_text_color(textX, textY, creditsString, textColor,textColor,textColor,textColor,1); break;
	case 1: draw_text_color(textX, textY, instructionsString, textColor,textColor,textColor,textColor,1); break;
}