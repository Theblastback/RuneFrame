/// @description Record tile map state before editing the tilemaps. Can't be created over collision boxes0


tile_size = 32;

// In a 3 x 3 grid, this sets coordinates to the exact center of the middle box
x = (floor(mouse_x / tile_size) * tile_size) + floor(tile_size / 2);

y = (floor(mouse_y / tile_size) * tile_size) + floor(tile_size / 2)

orig_x = x;
orig_y = y;