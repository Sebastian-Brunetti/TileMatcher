/// @description Check clicked cards

ds_list_add(waitingCards, checkCard);

currentFlippedCards += 1;

if (currentFlippedCards >= flippedCardLimit)
{
	with (obj_card)
	{
		clickable = false;
	}
	
	if (flippedCardLimit == 2 and waitingCards[|0] == waitingCards[|1])
	{
		correct = true;
		score += 10;
	}
	else if (flippedCardLimit == 3 and waitingCards[|0] == waitingCards[|1] and waitingCards[|0] == waitingCards[|2])
	{
		correct = true;
		score += 10;
	}
	else
	{
		correct = false;
		score -= 1;
	}
	
	alarm_set(0, 60);
	ds_list_clear(waitingCards);
}