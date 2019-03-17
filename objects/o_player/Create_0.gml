image_speed = 0.5;

hit = 0;

enum dir { x_dir, y_dir }

term_velocity = [10, 31, 7]; // Maximum speed one can fall
momentum = [0, 0];
on_ground = 0;
on_block = 0;
grav = 2; // I don't understand how the built in gravity propert works and interacts with the player object. I want full control

var layer_id = layer_get_id("Collision");
c_tilemap = layer_tilemap_get_id(layer_id);

charges = 5;

// -1 = left, 1 = right
facing = 1;
jump_speed = -32;
acceleration = 4;
tile_size = 32;
placement_down = 0;
stun_start = 0;
last_checkpoint = noone; // Stores the id of the last checkpoint

// Ability modifiers
stun_dur = 2000; // 2 seconds
stun_delay = 7000; // 7 second delay
air_break = false;

stun_charge = 0; // Add stun delay to it
stun_target = noone;

point_of_aim = 0; // Degrees

depth = -1000;