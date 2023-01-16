image_xscale = BRICK_SIZE / sprite_width;
image_yscale = BRICK_SIZE / sprite_height;
image_blend = make_color_hsv((point_distance(room_width / 2, room_height / 2, x, y) / 2) mod 255, 255, 255);
ds_grid_set_region(global.collision_cache, bbox_left, bbox_top, bbox_right, bbox_bottom, id);