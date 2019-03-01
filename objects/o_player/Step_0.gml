var bbox_side;
var air_x = 2;
/// Walking code

// Check key pressed down
var x_input = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * acceleration;



if ( on_ground ) {
	momentum[dir.x_dir] = clamp(momentum[dir.x_dir] + x_input, -term_velocity[dir.x_dir], term_velocity[dir.x_dir]);
} else
	momentum[dir.x_dir] = clamp(momentum[dir.x_dir] + x_input, -term_velocity[air_x], term_velocity[air_x]);


// Stop adding to momentum and go to idle animation, if not in air
if ( (x_input == 0) && on_ground) {
	// Set animation to idle
	momentum[dir.x_dir] = lerp(momentum[dir.x_dir], 0, 0.3);
}

// Gravity
momentum[dir.y_dir] = momentum[dir.y_dir] + grav;

if (on_ground) {
	// Jumping
	if (keyboard_check_pressed(ord("W")) ) {
		// sprite_index = name of sprite
		momentum[dir.y_dir] = jump_speed;
	}
} else {
	// Adjustable jump height
	if (keyboard_check_released(ord("W")) && (momentum[dir.y_dir] <= (jump_speed / 3)) ) {
		momentum[dir.y_dir] = jump_speed /3;
	}
}

// Apply terminal velocity
momentum[dir.y_dir] = clamp(momentum[dir.y_dir], -term_velocity[dir.y_dir], term_velocity[dir.y_dir]);

// Movement & collision detection
move_and_collide(c_tilemap, tile_size, momentum);

// Air detection
on_ground = tile_collide_at_points(c_tilemap, [bbox_left, bbox_bottom], [bbox_right -1, bbox_bottom]);


// Abilities here
var layer_id = layer_get_id("Sprites");

if ( mouse_check_button_pressed(mb_left) && !placement_down ) { // Redundancy check
	instance_create_layer(mouse_x, mouse_y, layer_id, o_place_block);
	placement_down = 1;
}

if ( mouse_check_button_released(mb_left) && placement_down ) {
	if ( (o_place_block.status == 0) && (charges > 0) ) {
		make_block();
		charges--;
	}
			
	placement_down = 0;
	instance_destroy(o_place_block);
}

if ( mouse_check_button_released(mb_right) )
	if ( placement_down ) {
		placement_down = 0;
		instance_destroy(o_place_block);
	} else { // Break block
		break_block();
		charges++;
	}