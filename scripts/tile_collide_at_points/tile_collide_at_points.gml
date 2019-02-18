///@param tile_set_id
///@param points_array...  

var tile_id = argument[0];

var result = false;

var vector2_x = 0;
var vector2_y = 1;

for (var i = 1; i < argument_count; i++) {
	var point = argument[i];
	result = result || tilemap_get_at_pixel(tile_id, point[vector2_x], point[vector2_y])
}

return result;