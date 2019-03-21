///@description Laser shoots right

next = noone; // ID of child
active = true; // Does the lazer burn? If so, let it continue.
base = true; // Start of laser
hit = false; // End of laser

var tile_size = 32;
var cur_id = id;
// Spawn lazer segments 

if (!tile_collide_at_points(global.c_tilemap, [x + tile_size, y]) ) {
	id.next = instance_create_layer(x + tile_size, y, global.sprite_layer, o_lazer_right);
	if (id.next.hit == true)
		id.next.sprite_index = s_laser_right_hit; //Laser hit
	else
		id.next.image_index = 1; // Laser line

	id.next.base = false;
} else {
	// Laser is impacting on walls
	id.hit = true;
}