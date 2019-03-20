// Basic movement
if (!id.stunned) {
	move_and_collide(global.c_tilemap, 32, [id.spd_base * id.facing, 0]);
	if ( tile_collide_at_points(global.c_tilemap, [bbox_left -1, bbox_top], [bbox_left -1, bbox_bottom], [bbox_right + 1, bbox_top], [bbox_right + 1, bbox_bottom]) ) { // Invert direction if bot is going to collide at wall
		id.facing *= -1;	
	}

	// If contact with player, damage them
	check_damage_player(id);
} else {
	if ( id.stun_start + id.stun_dur < current_time ) {
		id.stunned = false;
	}
}
