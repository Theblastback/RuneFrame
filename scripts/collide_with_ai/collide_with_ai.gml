///@param Block to check
var arg = argument[0];
var result = false;

var size = 1;
var ai_arr = array_create(size);
// Load array
ai_arr[0] = o_left_right_bot;

for (var i = 0; i < size; i++) {
	var inst = instance_nearest(arg.x, arg.y, ai_arr[i]);
	result = result | block_collides_with_others(arg, inst);
}

return result;