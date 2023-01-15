image_xscale = BRICK_SIZE / sprite_width;
image_yscale = BRICK_SIZE / sprite_height;

ds_grid_set_region(global.collision_cache, bbox_left, bbox_top, bbox_right, bbox_bottom, id);