// In step
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
	obstacle = collision_line_list(xprevious, yprevious, x, y, obstacle_parent, false, true, collision, true);
	
	if (obstacle) {
		obstacle = collision[| 0];
		x = xprevious;
		y = yprevious;
		direction += random_range(-1, 1);
	
		ball_rectangle_bounce(obstacle.bbox_right - xprevious, obstacle.bbox_top - yprevious, obstacle.bbox_left - xprevious, obstacle.bbox_bottom - yprevious);
	
		if (obstacle.object_index == brick_obj) {
			instance_destroy(obstacle);
		
			var ball_count = global.balls_active;
			var potential_ball_count = ball_count * power(3, instance_number(triple_obj) + 1);
			if (potential_ball_count <= MAX_BALLS) {// && random(1) < animcurve_channel_evaluate(global.triple_channel, potential_ball_count / MAX_BALLS)) {
				instance_create_layer(x, y, "PowerupLayer", triple_obj);
			}
		}
	}
	
	return;
} 

if (x > player_obj.bbox_left && x < player_obj.bbox_right && y > player_obj.bbox_top && y < player_obj.bbox_bottom) {
	direction = point_direction(player_obj.x, player_obj.y + player_obj.sprite_width / 2, x, y);
	return;
}