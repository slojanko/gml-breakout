function bool_to_string(value) {
	return value ? "true" : "false";
}

gml_pragma("forceinline");
function ball_triple() {
	var ball_count = instance_number(ball_obj);
	for(var i = 0; i < ball_count; i++)
	{
		var ball_old = instance_find(ball_obj, i);
			
		var ball_new = ball_get();
		ball_new.x = ball_old.x;
		ball_new.y = ball_old.y;
		ball_new.xprevious = ball_old.xprevious;
		ball_new.yprevious = ball_old.yprevious;
		ball_new.direction = ball_old.direction + random_range(100, 140);
		
		ball_new = ball_get();
		ball_new.x = ball_old.x;
		ball_new.y = ball_old.y;
		ball_new.xprevious = ball_old.xprevious;
		ball_new.yprevious = ball_old.yprevious;
		ball_new.direction = ball_old.direction + random_range(220, 260);
	}
	
	instance_activate_region(0, 0, room_width, room_height, true);
}

gml_pragma("forceinline");
function ball_get() {
	var ball_new = ds_stack_pop(global.ball_pool);
	return ball_new;
}

gml_pragma("forceinline");
function ball_release() {
	x = 10000;
	y = 10000;
	ds_stack_push(global.ball_pool, id);
}

gml_pragma("forceinline");
function ball_rectangle_bounce(rx1, ry1, rx2, ry2) {
	var ky = vspeed / hspeed;
	var kx = 1 / vspeed;
	
	var right_y = ky * rx1;
	var left_y = ky * rx2;
	var top_x = kx * ry1; 
	var bottom_x = kx * ry2; 
	
	var right_dist = (right_y > ry1 && right_y < ry2) ? rx1 * rx1 + right_y * right_y : 10000000;
	var left_dist = (left_y > ry1 && left_y < ry2) ? rx2 * rx2 + left_y * left_y : 10000000;
	var top_dist = (top_x < rx1 && top_x > rx2) ? top_x * top_x + ry1 * ry1 : 10000000;
	var bottom_dist = (bottom_x < rx1 && bottom_x > rx2) ? bottom_x * bottom_x + ry2 * ry2 : 10000000;
	
	var t = min(right_dist, left_dist, top_dist, bottom_dist);
	
	switch(t) {
		case right_dist: 
			hspeed = abs(hspeed);
			break;
		case left_dist: 
			hspeed = -abs(hspeed);
			break;
		case top_dist: 
			vspeed = -abs(vspeed);
			break;
		case bottom_dist: 
			vspeed = abs(vspeed);
			break;
	}
}