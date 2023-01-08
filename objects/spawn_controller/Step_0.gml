//with(ball_obj) {
//	if (collision_cache[round(x) + round(y) * room_width] == true) {
//		speed = 0;
//	}
//}
//for(var i = 79200 * 4 - 4; i >= 0; i-=4) {
//	array[i] += array[i+2];
//	array[i+1] -= array[i+3];
//}

//ds_grid_add_grid_region(grid, grid, 0, 2, 79200, 2, 0, 0);
//ds_grid_add_grid_region(grid, grid, 0, 3, 79200, 3, 0, 1);

if (mouse_check_button_pressed(mb_left)) {
	if (global.triple_spawned < TRIPLE_COUNT) {
		global.triple_spawned++;
		var ball_count = instance_number(ball_obj);
		for (var i = 0; i < ball_count; i++)
		{
			var ball_old = instance_find(ball_obj, i);
			var ball_new = instance_create_layer(ball_old.x, ball_old.y, "BrickLayer", ball_obj);
			ball_new.direction = ball_old.direction + random_range(60, 120);
				
			ball_new = instance_create_layer(ball_old.x, ball_old.y, "BrickLayer", ball_obj);
			ball_new.direction = ball_old.direction + random_range(120, 180);
		}
	}
}