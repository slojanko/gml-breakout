var obstacle = global.collision_cache[# x, y];
if (obstacle) {
	x -= hspeed;
	y -= vspeed;
	
	ball_rectangle_bounce(hspeed, vspeed, obstacle.bbox_right - x, obstacle.bbox_top - y, obstacle.bbox_left - x, obstacle.bbox_bottom - y);
	direction += random_range(-1, 1);
	
	//if (obstacle.object_index == brick_obj) {
		//instance_destroy(obstacle);
		pickup_triple()
	//}
}