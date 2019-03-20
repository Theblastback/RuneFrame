///@param ai_id

if ( block_collides_with_others(argument[0], o_player) && !o_player.stun_start) {
	o_player.stun_start = current_time;
	o_player.charges--;
	if (o_player.facing == argument[0].facing)
		o_player.momentum[0] = 7 * (argument[0].facing * -1);
	else
		o_player.momentum[0] = 7 * argument[0].facing;

if (o_player.on_ground)
		o_player.momentum[1] = -15;
}

if ( o_player.charges < 0 ) { // Back to checkpoint
	// Death animation here
	if (last_checkpoint != noone) {
		o_player.x = o_player.last_checkpoint.x;
		o_player.y = o_player.last_checkpoint.y;
	} else {
		o_player.x = start_x;
		o_player.y = start_y;
	}
	
	o_player.momentum[0] = 0;
	o_player.momentum[1] = 0;

	break_all();
	o_player.charges = 5;
}