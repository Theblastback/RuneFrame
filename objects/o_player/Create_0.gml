image_speed = 0.5;


enum dir { x_dir, y_dir }

term_velocity = [10, 31, 7]; // Maximum speed one can fall
momentum = [0, 0];
on_ground = 0;
grav = 2; // I don't understand how the built in gravity propert works and interacts with the player object. I want full control

var layer_id = layer_get_id("Collision");
c_tilemap = layer_tilemap_get_id(layer_id);


jump_speed = -32;
acceleration = 4;
tile_size = 32;
placement_down = 0;