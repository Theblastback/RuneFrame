///@description Remove placement block if button not released, or break block

if ( placement_down ) {
	placement_down = 0;
	instance_destroy(o_place_block);
} else { // Break block
	break_block();
}