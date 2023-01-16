if (y >= room_height) {
	if (speed == 0) {
		return;
	}

	ball_release();
	return;
}

var obstacle = global.collision_cache[# x, y];
if (obstacle) {
	ds_list_clear(collision);
	var line_obstacle = obstacle = collision_line_list(xprevious, yprevious, x, y, obstacle_parent, false, true, collision, true);
	
	if (line_obstacle) {
		obstacle = collision[| 0];
	}
	
	x = xprevious;
	y = yprevious;
	
	ball_rectangle_bounce(obstacle.bbox_right - x, obstacle.bbox_top - y, obstacle.bbox_left - x, obstacle.bbox_bottom - y);
		
	if (obstacle.object_index == brick_obj) {
		instance_destroy(obstacle);
		direction += random_range(-1, 1);
		
		var ball_count = global.balls_active;
		var potential_ball_count = ball_count * power(3, instance_number(triple_obj) + 1);
		if (potential_ball_count <= MAX_BALLS) { // && random(1) < animcurve_channel_evaluate(global.triple_channel, potential_ball_count / MAX_BALLS)) {
			instance_create_layer(x, y, "PowerupLayer", triple_obj);
		}
	}
	
	return;
} 

if (x > player_obj.bbox_left && x < player_obj.bbox_right && y > player_obj.bbox_top && y < player_obj.bbox_bottom) {
	direction = point_direction(player_obj.x, player_obj.y + player_obj.sprite_width / 2, x, y);
	return;
}