///@description Laser shoots up
var tile_size = 32;
next = noone; // ID of child
active = true; // Does the lazer burn? If so, let it continue.
base = true; // Start of laser
hit = false; // End of laser
parent_id = id;
object_type = o_lazer_up;



var cur_id = id;
// Spawn lazer segments 

if (!tile_collide_at_points(global.c_tilemap, [x, y - tile_size]) ) {
	id.next = instance_create_layer(x, y - tile_size, global.sprite_layer, o_lazer_up);
	if (id.next.hit == true)
		id.next.sprite_index = s_laser_up_hit; //Laser hit
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