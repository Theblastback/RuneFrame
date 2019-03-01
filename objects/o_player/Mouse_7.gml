/// @description Place block if placement block is valid

if ( placement_down ) {
	placement_down = 0;
	instance_destroy(o_place_block);
	make_block();
}
