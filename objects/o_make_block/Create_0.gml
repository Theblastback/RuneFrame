/// @description Record tile map state before editing the tilemaps. Can't be created over collision boxes0


tile_size = 32;

// In a 3 x 3 grid, this sets coordinates to the exact center of the middle box
x = mouse_x;

if ( (x % tile_size) > (tile_size / 2) ) {
	x = bbox_right & ~(tile_size - 1);
	x -= bbox_right - x;
} else {
	x = bbox_left & ~(tile_size -1);
	x += tile_size + x - bbox_left;
}

y = mouse_y;

if ( (y % tile_size) > (tile_size / 2) ) {
	y = bbox_bottom & ~(tile_size - 1);
	y -= bbox_bottom - y;
} else {
	y = bbox_top & ~(tile_size -1);
	y+= tile_size + y - bbox_top;
}
