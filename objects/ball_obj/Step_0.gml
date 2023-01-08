var obstacle = global.collision_cache[# x, y];
if (obstacle) {
	global.checks++;
	xprevious = x - hspeed;
	yprevious = y - vspeed;
	obstacle = collision_line(xprevious, yprevious, x, y, obstacle_parent, false, true);
	if (obstacle == noone) {
		return;
	}
	
	var edge = line_rectangle_intersection(xprevious, yprevious, x, y, obstacle.bbox_right, obstacle.bbox_top, obstacle.bbox_left, obstacle.bbox_bottom);
	show_debug_message(edge);
	switch(edge) {
		case 1:
		case 3:
			hspeed = -hspeed;
			break;
		case 2:
		case 4:
			vspeed = -vspeed;
			break;
		default:
	}
	
	x = xprevious;
	y = yprevious;
	
	if (obstacle.object_index == brick_obj) {
		instance_destroy(obstacle);
		
		if (global.triple_spawned < TRIPLE_COUNT && random(1) < animcurve_channel_evaluate(global.triple_channel, global.triple_spawned / TRIPLE_COUNT)) {
			global.triple_spawned++;
			var ball_count = instance_number(ball_obj);
			for (var i = 0; i < ball_count; i++)
			{
				var ball_old = instance_find(ball_obj, i);
				var ball_new = instance_create_layer(ball_old.x, ball_old.y, "BrickLayer", ball_obj);
				ball_new.direction = ball_old.direction + 120;
				
				ball_new = instance_create_layer(ball_old.x, ball_old.y, "BrickLayer", ball_obj);
				ball_new.direction = ball_old.direction + 240;
			}
		}
	}
}