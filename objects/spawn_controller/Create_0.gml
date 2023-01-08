show_debug_overlay(true);
show_debug_message("code_is_compiled " + bool_to_string(code_is_compiled()));
randomize();

global.collision_cache = ds_grid_create(room_width, room_height);
for(var xx = BRICK_SIZE / 2; xx <= room_width - BRICK_SIZE / 2; xx += BRICK_SIZE) {
	for(var yy = BRICK_SIZE / 2; yy <= room_height - BRICK_SIZE / 2; yy += BRICK_SIZE) {
		if (collision_point(xx, yy, brick_placeholder_obj, false, true)) {
			instance_create_layer(xx, yy, "BrickLayer", brick_obj);
		}
	}
}

instance_destroy(brick_placeholder_obj);

//var collision_check = 8 + BALL_SIZE;
//for(var xx = 0; xx < room_width; xx++) {
//	for(var yy = 0; yy < room_height; yy++) {
//		var collision = collision_point(xx, yy, obstacle_parent, false, true);
//		if (collision) {
//			global.collision_cache[xx + yy * room_width] = collision;	
//		}
//	}
//	show_debug_message(xx);
//}

//array = array_create(79200 * 4);
//grid = ds_grid_create(79200, 4);
//for(var i = 0; i < 79200; i++) {
//	grid[# i, 0] = irandom(1920);
//	grid[# i, 1] = irandom(1080);
//	grid[# i, 2] = irandom(6)-3;
//	grid[# i, 3] = irandom(6)-3;
//}