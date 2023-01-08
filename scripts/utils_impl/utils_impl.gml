function bool_to_string(value) {
	return value ? "true" : "false";
}

function line_rectangle_intersection(px1, py1, px2, py2, rx1, ry1, rx2, ry2) {
	px2 -
	var ky = (py2 - py1) / (px2 - px1);
	var kx = 1 / ky;
	
	var right_y = py1 + ky * (rx1 - px1);
	var left_y = py1 + ky * (rx2 - px1);
	var top_x = px1 + kx * (ry1 - py1); 
	var bottom_x = px1 + kx * (ry2 - py1); 
	
	var right_dist = (right_y > ry1 && right_y < ry2) ? point_distance(px1, py1, rx1, right_y) : 1000;
	var left_dist = (left_y > ry1 && left_y < ry2) ? point_distance(px1, py1, rx2, left_y) : 1000;
	var top_dist = (top_x < rx1 && top_x > rx2) ? point_distance(px1, py1, top_x, ry1) : 1000;
	var bottom_dist = (bottom_x < rx1 && bottom_x > rx2) ? point_distance(px1, py1, bottom_x, ry2) : 1000;
	
	switch(min(right_dist, left_dist, top_dist, bottom_dist)) {
		case right_dist: 
			return 1;
			break;
		case left_dist: 
			return 3;
			break;
		case top_dist: 
			return 2;
			break;
		case bottom_dist: 
			return 4;
			break;
	}
	
	return 0;
}