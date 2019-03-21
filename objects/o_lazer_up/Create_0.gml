///@description Laser shoots up

next = noone; // ID of child
active = true; // Does the lazer burn? If so, let it continue.
base = true; // Start of laser
hit = false; // End of laser

var tile_size = 32;
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