///@description cycle through ALL lasers on screen, and adjusts them (Each frame)
///@param ID_make_block


var arg = argument[0];
// Record which lasers to adjust
var list = ds_list_create();

with (o_lazers) {
//	if ( position_meeting(arg.x - 32, arg.y - 32, o_lazers) )
//		ds_list_add(list, id.parent_id);
//	if ( position_meeting(arg.x + 32, arg.y + 32, o_lazers) )
//		ds_list_add(list, id.parent_id);
	if ( position_meeting(arg.x, arg.y, o_lazers) )
		ds_list_add(list, id.parent_id); 
}

ds_list_sort(list, true)
show_debug_message(ds_list_size(list));
show_debug_message("+++++++++++++++++++++++++++++++++++++++++++++++++++");
for (var i = 0; i < ds_list_size(list); i++) {
	if ( (i != 0) && (list[| (i-1)] < list[| i]) ) {
//	var object_type = list[| i].object_type;
//	var xx = list[| i].x;
//	var yy = list[| i].y;
	
//	instance_create_layer(xx, yy, global.sprite_layer, object_type);
		destroy_lazer(list[| i]);	
		show_debug_message(list[| i]);
	}
}

ds_list_destroy(list);