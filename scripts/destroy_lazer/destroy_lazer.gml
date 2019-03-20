///@description Recursively destroys the lazers
///@param ID_to_destroy_from

if (argument[0].next != noone)
	destroy_lazer(argument[0].next);
	
instance_destroy(argument[0]);