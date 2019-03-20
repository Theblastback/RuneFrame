///@description take current mouse coordinates, interpolate and determine if an enemy is hit
if (o_player.charges > 0) {
	var hypo = point_distance(o_player.x, o_player.y, mouse_x, mouse_y);
	var x_dist = lengthdir_x(hypo, o_player.point_of_aim);

	if ( x_dist < 0 )
		var direct = -1;
	else
		var direct = 1;
				
	x_dist = abs(x_dist);
	var slope = lengthdir_y(hypo, o_player.point_of_aim) / x_dist;

	var xx = o_player.x + (direct * 600);
	var yy = o_player.y + (600 * slope);

	var target = collision_line(o_player.x, o_player.y, xx, yy, o_AI, false, true);
	if (target != noone) {
		var collision = false;

		for (var i = 1; i < x_dist; i++) {
			collision = tile_collide_at_points(global.c_tilemap, [o_player.x + i, o_player.y + (i *slope)]);
			if (collision)
				break;
		}
		if ( !collision ) { // Successfully hit enemy
	 	// Remove old stunned target
			if ( (o_player.stun_target != noone) && (o_player.stun_target != target) ) {
				o_player.stun_target.stunned = false;
				o_player.stun_target.stun_dur = 0;
			}
		
			target.stunned = true;
			target.stun_dur = o_player.stun_dur;
			target.stun_start = current_time
			o_player.stun_target = target;
		}
	}
	// Drain charge
	o_player.charges--;
	o_player.stuns_used++;
	if ( o_player.stuns_used == 0 ) // First charge, set the time
		o_player.stun_cooldown = current_time;
}