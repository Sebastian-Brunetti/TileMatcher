randomize();

var backgroundId = layer_background_get_id("Background");	//set background layer
layer_background_index(backgroundId, choose(0,1));			//randomize background sprite on game launch

flippedCardLimit = global.difficulty;	//read number of cards from global "difficulty" variable (set in "Menu object)

score = 0;
tileSprites = spr_card;				//set reference to the card sprites to select later

UIFont = fnt_UI;					//set reference to font type
draw_set_font(UIFont);				//set font to previous reference

//---UI VARIABLES---//
UIlocationY = room_height-30; 
UIScoreX = 30;
UIRemainingCardsX = room_width-30;
UIColor = c_white;

//---CARD VARIABLES---//
amountOfCards = 12;
cardsPerRow = 4;
currentFlippedCards = 0;			//to track during gameplay
remainingCards = 0;					//"Game Over" condition
differentCards = amountOfCards / flippedCardLimit; //how many different cards will be needed, based on how many copies there are of each

//---IN-GAME CHECKS---//
waitingCards = ds_list_create();	//array to match selected "waiting" cards
checkCard = -1;						//ID of selected card
correct = false;

//---GAME SETUP---//
switch (global.tileTopics)			//to select the type of objects to match (using main menu buttons)
{
	case 0: tileSprites = spr_animals; break;		//ANIMALS
	case 1: tileSprites = spr_colors; break;		//COLORS
	case 2: tileSprites = spr_shapes; break;		//SHAPES
	case 3: tileSprites = spr_food; break;			//FOOD
}

object_set_sprite(obj_card, tileSprites);			//set the objects sprite to the "card" object

//---RANDOMIZING SELECTED OBJECTS---//
framesInSprite = sprite_get_number(tileSprites)-1;	//how many different possible objects to select from?
spriteSelectorList = ds_list_create();				//create a list from all possible objects to choose randomly

var q = 0; repeat (framesInSprite)					//this loop copies all objects to a list and assigns an ID
{
	var randomID = q+1;
	ds_list_add(spriteSelectorList, randomID)
	q++;
}
ds_list_shuffle(spriteSelectorList);				//shuffle objects list

selectedSpritesID = ds_list_create();				//create a new list, only for selected objects

var i = 0; repeat (differentCards)					//this loop populates the selected object list
{
	var addID = spriteSelectorList[| i];
	repeat (flippedCardLimit)						//this loop adds 2 or 3 copies of each selected card, depending on selected difficulty
	{
		ds_list_add(selectedSpritesID, addID);
	}
	i++;
}
ds_list_shuffle(selectedSpritesID);					//shuffle the final card list

//---DEBUGGING MESSAGE---//
var k = 0; repeat(12)
{
	show_debug_message(string(selectedSpritesID[|k]))
	k++;
}
//---DEBUGGING MESSAGE---//

//---SPAWN CARDS IN LOCATIONS---//
var ii = 0; repeat(amountOfCards)					//this loop spawns each card from the final card list in a specific location
{
	var spawnX = ((ii mod cardsPerRow) * 250)+150;	//measurements done in pixels
	var spawnY = ((ii div cardsPerRow) * 250)+150;	//measurements done in pixels
	
	var chosenCard = selectedSpritesID[| ii];
	var spawnedCard = instance_create_layer(spawnX, spawnY, "Cards", obj_card);
	remainingCards += 1;
	
	with (spawnedCard)
	{
		cardID = chosenCard;
	}
	ii++;
}