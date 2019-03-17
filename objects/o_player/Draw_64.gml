draw_text(5, 5, id.facing);
draw_text(5, 20, id.charges);
if ( mouse_check_button_released(mb_middle) )
	hit = stun_enemy();

draw_text(5, 50, hit);