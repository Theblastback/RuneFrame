///@description cycle through ALL near make block, and adjusts them
///@param XY_Vect

var arg = argument[0];
// Record which lasers to adjust
var list = ds_list_create();

// Record origin and destroy all lasers around what was a block
{ do {
	var thing = collision_rectangle(arg[0] -64, arg[1] -64, arg[0] +64, arg[1] +64, o_lazers, false, true);
	if ( thing  != noone ) {
		ds_list_add(list, [thing.parent_id.x, thing.parent_id.y, thing.parent_id.object_type]);
		destroy_lazer(thing.parent_id);
	}
} until (thing == noone);}



// Replace lasers
for (var i = 0; i < ds_list_size(list); i++) {
	var temp = list[| i];
	instance_create_layer(temp[0], temp[1], global.sprite_layer, temp[2]);
}

ds_list_destroy(list);