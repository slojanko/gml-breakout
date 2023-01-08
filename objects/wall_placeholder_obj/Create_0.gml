for(var xx = bbox_left; xx <= bbox_right; xx++) {
	for(var yy = bbox_top; yy <= bbox_bottom; yy++) {
		global.collision_cache[xx + yy * room_width] = self;
	}
}

show_debug_message((bbox_right - bbox_left) * (bbox_bottom - bbox_top));