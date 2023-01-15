image_xscale = BALL_SIZE / sprite_width;
image_yscale = BALL_SIZE / sprite_height;
direction = 90;
speed = BALL_SPEED;
collision = ds_list_create();

////var obstacle = collision_point(x, y, player_obj, false, true);
////if (obstacle) {
////	direction = point_direction(obstacle.x, obstacle.y, x, y);
////	return;
////}

//// obstacle = global.collision_cache[# x, y];
//var obstacle = place_meeting(x, y, brick_obj);
//if (obstacle) {
//	ball_rectangle_bounce(obstacle.bbox_right - x, obstacle.bbox_top - y, obstacle.bbox_left - x, obstacle.bbox_bottom - y);
//	direction += random_range(-1, 1);
	
//	//if (obstacle.object_index == brick_obj) {
//	//	// instance_destroy(obstacle);
		
//	//	var ball_count = ds_list_size(global.ball_active);
//	//	var potential_ball_count = ball_count * power(3, instance_number(triple_obj) + 1);
//	//	if (potential_ball_count < MAX_BALLS && random(1) < animcurve_channel_evaluate(global.triple_channel, potential_ball_count / MAX_BALLS)) {
//	//		//instance_create_layer(x, y, "PowerupLayer", triple_obj);
//	//	}
//	//}
//} 