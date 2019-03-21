///@description Checks to see if place block is over laser. Returns true if can't spawn.

var ret_val = false;
var list = ds_list_create();
with (o_lazers) {
	if ( position_meeting(o_place_block.x - 32, o_place_block.y - 32, o_lazers) )
		ds_list_add(list, id.parent_id);
	if ( position_meeting(o_place_block.x + 32, o_place_block.y + 32, o_lazers) )
		ds_list_add(list, id.parent_id);
	if ( position_meeting(o_place_block.x, o_place_block.y, o_lazers) )
		ds_list_add(list, id.parent_id);
}

// Block is over lasers, but isn't allowed to do so
if ( (ds_list_size(list) > 0 ) && o_player.laser_spawn )
	ret_val = true;

// Check base ids to see if they're in block
for (var i = 0; i < ds_list_size(list); i++) {
	if ( position_meeting(list[| i].x, list[| i].y, o_place_block) ) {
		ret_val = true;
		break;
	}
}

return ret_val;