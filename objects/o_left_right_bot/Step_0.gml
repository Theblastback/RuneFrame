/// @description Insert description here
// You can write your code in this editor

move_and_collide(c_tilemap, 32, [spd * facing, 0]);

if ( tile_collide_at_points(c_tilemap, [bbox_left -1, bbox_top], [bbox_left -1, bbox_bottom], [bbox_right + 1, bbox_top], [bbox_right + 1, bbox_bottom]) ) { // Invert direction if bot is going to collide at wall
	facing *= -1;	
}

// Contact with player, damage them