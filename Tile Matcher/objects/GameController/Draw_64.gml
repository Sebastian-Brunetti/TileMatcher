var c = UIColor;
var scoreText = "Score: "+string(score);
var remainingCardsText = "Remaining Cards: "+string(remainingCards);
//var setText = "Current set: "+string(currentSet);

draw_set_halign(fa_left);
draw_text_color(UIScoreX, UIlocationY, scoreText, c,c,c,c,1);

draw_set_halign(fa_center);
//draw_text_color(UISetX, UIlocationY, setText, c,c,c,c,1);

draw_set_halign(fa_right);
draw_text_color(UIRemainingCardsX, UIlocationY, remainingCardsText , c,c,c,c,1);