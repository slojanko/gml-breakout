function bool_to_string(value) {
	return value ? "true" : "false";
}

function line_rectangle_intersection(px1, py1, px2, py2, rx1, ry1, rx2, ry2) {
	var ky = (py2 - py1) / (px2 - px1);
	var kx = 1 / ky;
	
	var right_dist = line_vertical_intersect(px1, py1, ky, rx1);
	var left_dist = line_vertical_intersect(px1, py1, ky, rx2);
	var top_dist = line_horizontal_intersect(px1, py1, kx, ry1);
	var bottom_dist = line_horizontal_intersect(px1, py1, kx, ry2);
	
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

function line_vertical_intersect(px, py, ky, lx) {
	var ly = py + ky * (lx - px);
	return point_distance(px, py, lx, ly);
}

function line_horizontal_intersect(px, py, kx, ly) {
	var lx = px + kx * (ly - py);
	return point_distance(px, py, lx, ly);
}