///@description This script checks to see if one instance collides with other instances (Checks all sides)
///@param inst id of block, objects to be checked against

var o0 = argument[0];
var o1 = argument[1];

var result = position_meeting(o0.bbox_left, o0.bbox_top, o1) || position_meeting(o0.bbox_left, o0.y, o1) || position_meeting(o0.bbox_left, o0.bbox_bottom, o1) ||
			position_meeting(o0.bbox_right, o0.bbox_top, o1) || position_meeting(o0.bbox_right, o0.y, o1) || position_meeting(o0.bbox_right, o0.bbox_bottom, o1) ||
			/*Up checks*/position_meeting(o0.bbox_left, o0.bbox_top, o1) || position_meeting(o0.x, o0.bbox_top, o1) || position_meeting(o0.bbox_right, o0.bbox_top, o1) ||
			/*Bottom checks*/position_meeting(o0.bbox_left, o0.bbox_bottom, o1) || position_meeting(o0.x, o0.bbox_bottom, o1) || position_meeting(o0.bbox_right, o0.bbox_bottom, o1);


return result;