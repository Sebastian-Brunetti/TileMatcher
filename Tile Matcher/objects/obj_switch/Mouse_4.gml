if (Menu.showInformation >= 0) {exit;}

normalMode = !normalMode;

var normalModeVar = normalMode;
with (obj_diffSign)
{
	if (normalModeVar)
	{
		intendedX = posXNormal;
		image_index = 0;
	}
	else
	{
		intendedX = posXHard;
		image_index = 1;
	}
}

with (Menu)
{
	if (normalModeVar)
	{
		global.difficulty = 2;
	}
	else
	{
		global.difficulty = 3;
	}
}