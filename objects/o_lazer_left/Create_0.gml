///@description Laser shoots left
var tile_size = 32;
next = noone; // ID of child
active = true; // Does the lazer burn? If so, let it continue.
base = true; // Start of laser
hit = false; // End of laser
parent_id = id;
laser_sprite = s_laser_left;
laser_hit_sprite = s_laser_left_hit;
object_type = o_lazer_left;
adjust_x = -tile_size;
adjust_y = 0;
parent_id = id;

var cur_id = id;
// Spawn lazer segments 

if (!tile_collide_at_points(global.c_tilemap, [x - tile_size, y]) ) {
	id.next = instance_create_layer(x - tile_size, y, global.sprite_layer, o_lazer_left);
	if (id.next.hit == true)
		id.next.sprite_index = s_laser_left_hit;//Laser hit
	else
		id.next.image_index = 1; // Laser line

	id.next.base = false;
} else {
	// Laser is impacting on walls
	id.hit = true;
}

if ( id.base == true ) {
	var temp_id = id;
	// Set all the parent id's to this one
	while (temp_id.next != noone) {
		temp_id.next.parent_id = temp_id.parent_id;
		temp_id = temp_id.next;
	}
}