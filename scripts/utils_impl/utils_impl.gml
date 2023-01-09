function bool_to_string(value) {
	return value ? "true" : "false";
}

function pickup_triple() {
	if (global.triple_spawned < TRIPLE_COUNT) { // && random(1) < animcurve_channel_evaluate(global.triple_channel, global.triple_spawned / TRIPLE_COUNT)) {
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

gml_pragma("forceinline");
function ball_rectangle_bounce(px2, py2, rx1, ry1, rx2, ry2) {
	var ky = py2 / px2;
	var kx = 1 / ky;
	
	var right_y = ky * rx1;
	var left_y = ky * rx2;
	var top_x = kx * ry1; 
	var bottom_x = kx * ry2; 
	
	var right_dist = (right_y > ry1 && right_y < ry2) ? rx1 * rx1 + right_y + right_y : 1000;
	var left_dist = (left_y > ry1 && left_y < ry2) ? rx2 * rx2 + left_y * left_y : 1000;
	var top_dist = (top_x < rx1 && top_x > rx2) ? top_x * top_x + ry1 * ry1 : 1000;
	var bottom_dist = (bottom_x < rx1 && bottom_x > rx2) ? bottom_x * bottom_x + ry2 * ry2 : 1000;
	
	switch(min(right_dist, left_dist, top_dist, bottom_dist)) {
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