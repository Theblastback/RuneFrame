///@param Block to check
var arg = argument[0];
var result = false;


var inst = instance_nearest(arg.x, arg.y, o_AI);
result = block_collides_with_others(arg, inst);


return result;