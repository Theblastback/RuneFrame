/// @description Block tries to auto center itself each frame. Also changes colors accordingly

var tile_size = 32;
var range = 256; // Distance of hypotinuse of player to center of block


x = (floor(mouse_x / tile_size) * tile_size) + floor(tile_size / 2);
y = (floor(mouse_y / tile_size) * tile_size) + floor(tile_size / 2);

// Check to see if block is out of range
var a, b, c;

a = x - o_player.x;	
b = y - o_player.y;

c = (a * a) + (b * b);

if ( c > (range * range) )
	status = types.out_of_range;
	
// Check to see if block is inside player (Only ever will be one of each block)
if ( block_collides_with_others(o_place_block, o_player) )
	status = types.colliding;
	
image_index = status;