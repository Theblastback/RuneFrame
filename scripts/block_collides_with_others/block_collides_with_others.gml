///@description This script checks to see if one instance collides with other instances (Checks all sides)
///@param Block
///@param Object

var o0 = argument[0];
var o1 = argument[1];


var result = false;			

if ( ((o0.bbox_left >= o1.bbox_left) && (o0.bbox_left <= o1.bbox_right)) ||
	 ((o0.bbox_right <= o1.bbox_right) && (o0.bbox_right >= o1.bbox_left)) ||
	 ((o0.x <= o1.bbox_right) && (o0.x >= o1.bbox_left)) ) {

	if ( ((o0.bbox_top >= o1.bbox_top) && (o0.bbox_top <= o1.bbox_bottom)) ||
		 ((o0.bbox_bottom <= o1.bbox_bottom) && (o0.bbox_bottom >= o1.bbox_top)) ||
		 ((o0.y <= o1.bbox_bottom) && (o0.y >= o1.bbox_top)) ) {
		result = true;
	}
}
// Center check

return result;