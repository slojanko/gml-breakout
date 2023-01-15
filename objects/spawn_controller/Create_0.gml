for(var xx = BRICK_SIZE / 2; xx <= room_width - BRICK_SIZE / 2; xx += BRICK_SIZE) {
	for(var yy = BRICK_SIZE / 2; yy <= room_height - BRICK_SIZE / 2; yy += BRICK_SIZE) {
		if (collision_point(xx, yy, brick_placeholder_obj, true, true)) {
			instance_create_layer(xx, yy, "BrickLayer", brick_obj);
		}
	}
}

instance_destroy(brick_placeholder_obj);