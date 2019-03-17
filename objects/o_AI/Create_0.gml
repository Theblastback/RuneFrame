/// @description Basis for all other AI

// -1 = left/down, 1 = right/up
facing = -1;
stunned = false;

stun_start = 0;
stun_dur = 0;

spd_base = 4;

var layer_id = layer_get_id("Collision");
c_tilemap = layer_tilemap_get_id(layer_id);