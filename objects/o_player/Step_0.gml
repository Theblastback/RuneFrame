/// Walking code

// Check key pressed down
if (keyboard_check(ord("D")) ) {
	// sprite_index = name of the sprite
	// Cap moment at 15 pixels per tick
	if (momentum_x <= 35) {
		momentum_x += 1;
	}
	
	x += momentum_x;
}

if (keyboard_check(ord("A")) ) {
	// sprite_index = name of sprite
	if (momentum_x >= -35) {
		momentum_x -= 1;
	}
	
	x += momentum_x;
}

if (keyboard_check(ord("W")) && !air_borne) {
	// sprite_index = name of sprite
	momentum_y = 50;
	y += momentum_y;
}

if (keyboard_check(ord("S")) ) {
	// Find block on and try to phase through it
}

// Stop adding to momentum and go to idle animation, if not in air
if ( (keyboard_check_released(ord("D"))) && (keyboard_check_released(ord("A"))) ) {
	
	if ( !air_borne ) {
		// Set animation to idle
		if (momentum_x < 0)
			momentum_x += 1;
		else if (momentum_x > 0)
			momentum_x -= 1;
	}
}


// Collision checking here
