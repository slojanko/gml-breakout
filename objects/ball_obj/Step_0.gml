//var obstacle = global.collision_cache[round(x) + round(y) * room_width];
//if (obstacle) {
//	move_bounce_solid(false);
	
//	if (obstacle.object_index == brick_obj) {
//		instance_destroy(obstacle);
		
//		if (global.triple_spawned < TRIPLE_COUNT && random(1) < animcurve_channel_evaluate(global.triple_channel, 0)) { // global.triple_spawned / TRIPLE_COUNT)) {
//			global.triple_spawned++;
//			var ball_count = instance_number(ball_obj);
//			for (var i = 0; i < ball_count; i++)
//			{
//				var ball_old = instance_find(ball_obj, i);
//				var ball_new = instance_create_layer(ball_old.xprevious, ball_old.yprevious, "BrickLayer", ball_obj);
//				ball_new.direction += 120;
				
//				ball_new = instance_create_layer(ball_old.xprevious, ball_old.yprevious, "BrickLayer", ball_obj);
//				ball_new.direction += 240;
//			}
//		}
//	}
//}