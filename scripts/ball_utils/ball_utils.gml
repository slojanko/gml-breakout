function bool_to_string(value) {
	return value ? "true" : "false";
}

gml_pragma("forceinline");
function ball_triple() {
	var ball_count = global.balls_active;
	if (ball_count > MAX_BALLS_FOR_TRIPLE) {
		ball_count = floor((MAX_BALLS - ball_count) / 2);
	}
	
	for(var i = 0; i < MAX_BALLS; i++) {
		var ball_old = global.ball_pool[i];
		if (ball_old.speed == 0) {
			continue;
		}
		
		if (ball_count == 0) {
			break;
		}
		
		ball_count--;
			
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
	
	for(var i = 0; i < MAX_BALLS; i++) {
		if (global.ball_pool[i].y < 9000) {
			global.ball_pool[i].speed = BALL_SPEED;
		}
	}
}

gml_pragma("forceinline");
function ball_get() {
	var ball_new = global.ball_pool[ds_stack_pop(global.ball_free_indices)];
	global.balls_active++;
	return ball_new;
}

gml_pragma("forceinline");
function ball_release() {
	speed = 0;
	ds_stack_push(global.ball_free_indices, index);
	global.balls_active--;
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