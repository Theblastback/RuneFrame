///@description Laser shoots left


next = noone; // ID of child
active = true; // Does the lazer burn? If so, let it continue.
base = true; // Start of laser
hit = false; // End of laser

var tile_size = 32;
var cur_id = id;
// Spawn lazer segments 
/*
if (!tile_collide_at_points(o_player.c_tilemap, [x - tile_size, y]) ) {
	id.next = instance_create_layer(x - tile_size, y, global.sprite_layer, o_lazer_left);
	if (id.next.hit == true)
		//if.next.sprite_index = ;//Laser hit
	else
		//id.next.sprite_index = ; // Laser line

	id.next.base = false;
} else {
	// Laser is impacting on walls
	id.hit = true;
}*/