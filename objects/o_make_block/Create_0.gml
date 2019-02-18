/// @description Record tile map state before editing the tilemaps

tile_state = [
	[0, 0, 0],
	[0, 0, 0], 
	[0, 0, 0] ]; // 1 equates to pre-existing colison box

tile_size = 32;

var layer_id = layer_get_id("Collision");
c_tilemap = layer_tilemap_get_id(layer_id)

// In a 3 x 3 grid, this sets coordinates to the exact center of the middle box
x = mouse_x;

if ( (x % tile_size) >= (tile_size / 2) ) {
	x = bbox_right & ~(tile_size - 1);
	x -= bbox_right - x;
} else {
	x = bbox_left & ~(tile_size -1);
	x += tile_size + x - bbox_left;
}

y = mouse_y;

if ( (y % tile_size) >= (tile_size / 2) ) {
	y = bbox_bottom & ~(tile_size - 1);
	y -= bbox_bottom - y;
} else {
	y = bbox_top & ~(tile_size -1);
	y+= tile_size + y - bbox_top;
}

// Record states of other boxes
var xx = x - tile_size; // Leftmost box
var yy = y - tile_size; // Topmost box

for (var x_dir = 0; x_dir < 3; x_dir++) {
	for (var y_dir = 0; y_dir < 3; y_dir++) {
		tile_state[x_dir, y_dir] = tile_collide_at_points(c_tilemap, [xx + (x_dir * tile_size), yy + (y_dir * tile_size)]);
	}
}