var layer_id = layer_get_id("Collision");
var c_collide = layer_tilemap_get_id(layer_id);

if (position_meeting(mouse_x, mouse_y, o_make_block)) {
	var inst = instance_position(mouse_x, mouse_y, o_make_block);
	with (inst) {
		var xx = inst.orig_x - tile_size;
		var yy = inst.orig_y - tile_size;
		for (var x_dir = 0; x_dir < 3; x_dir++) {
			for (var y_dir = 0; y_dir < 3; y_dir++) {
				var cell_x = (xx + (x_dir * tile_size)) / tile_size;
				var cell_y = (yy + (y_dir * tile_size)) / tile_size;
				
				var data = tilemap_get(c_collide, cell_x, cell_y);
				data = tile_set_empty(data);
				tilemap_set(c_collide, data, cell_x, cell_y);
			}
		}
		instance_destroy();
	}
}

