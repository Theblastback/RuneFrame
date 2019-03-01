enum types { valid, out_of_range, colliding }

var layer_id = layer_get_id("Collision");
c_tilemap = layer_tilemap_get_id(layer_id);

status = 0;