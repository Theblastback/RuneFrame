enum types { valid, out_of_range, colliding }

var layer_id = layer_get_id("Collision");
c_tilemap = layer_tilemap_get_id(layer_id);

status = 0;


ai_arr_size = 1;
ai_arr = array_create(ai_arr_size);
// Loading values into checking array
ar_arr[0] = o_left_right_bot;