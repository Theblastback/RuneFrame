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