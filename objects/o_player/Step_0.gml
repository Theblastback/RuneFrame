var bbox_side;

var x_dir = 0;
var y_dir = 1;
var air_x = 2;
/// Walking code

// Check key pressed down
var x_input = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * acceleration;



if ( on_ground ) {
	momentum[x_dir] = clamp(momentum[x_dir] + x_input, -term_velocity[x_dir], term_velocity[x_dir]);
} else
	momentum[x_dir] = clamp(momentum[x_dir] + x_input, -term_velocity[air_x], term_velocity[air_x]);


// Stop adding to momentum and go to idle animation, if not in air
if ( (x_input == 0) && on_ground) {
	// Set animation to idle
	momentum[x_dir] = lerp(momentum[x_dir], 0, 0.3);
}

// Gravity
momentum[y_dir] = momentum[y_dir] + grav;

// Apply terminal velocity
momentum[y_dir] = clamp(momentum[y_dir], -term_velocity[y_dir], term_velocity[y_dir]);

// Movement & collision detection
move_and_collide(c_tilemap, tile_size, momentum);

// Air detection
on_ground = tile_collide_at_points(c_tilemap, [bbox_left, bbox_bottom], [bbox_right -1, bbox_bottom]);

if (on_ground) {
	// Jumping
	if (keyboard_check_pressed(ord("W")) ) {
		// sprite_index = name of sprite
		momentum[y_dir] = jump_speed;
	}
} else {
	// Adjustable jump height
	if (keyboard_check_released(ord("W")) && (momentum[y_dir] <= (jump_speed / 3)) ) {
		momentum[y_dir] = jump_speed /3;
	}
}

// Abilities here