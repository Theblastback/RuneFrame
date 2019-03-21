///@description cycle through ALL lasers on screen, and adjusts them (Each frame)
///@param ID_make_block

var arg = argument[0];
// Checks diagonally inside the make block. Only need to check 3 "tiles"
for (var i = -31; i < 32; i+=31) {
	{ do {
		var thing = instance_position(arg.x +i, arg.y +i, o_lazers);
		if ( thing  != noone ) {
			instance_create_layer(thing.parent_id.x, thing.parent_id.y, global.sprite_layer, thing.object_type);
			destroy_lazer(thing.parent_id);
		}
	} until (thing == noone);}
}
