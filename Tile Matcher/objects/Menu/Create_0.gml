randomize();

var backgroundId = layer_background_get_id("Background");
layer_background_index(backgroundId, choose(0,1));

global.tileTopics = -1;
global.difficulty = 2;

showInformation = -1;
textColor = c_white;

draw_set_font(fnt_menuUI);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
textX = room_width/2;
textY = room_height/2;

creditsString = @"
Credits:

Art from OpenGameArt
-Animal sprites by Kenney.nl
-Food sprites by Ravenmore

Music by Vexento

All assets used with permission";

instructionsString = @"
Instructions:

Find all copies of the cards!

There's 2 of every card in EASY
There's 3 of every card in HARD";

musicSelector = irandom_range(1, 5);

switch (musicSelector)
{
	case 1: audio_play_sound(msc_Snowflakes, 2, true); break;
	case 2: audio_play_sound(msc_Soldiers, 2, true); break;
	case 3: audio_play_sound(msc_Spark, 2, true); break;
	case 4: audio_play_sound(msc_Capurgana, 2, true); break;
	case 5: audio_play_sound(msc_Anesthesia, 2, true); break;
}