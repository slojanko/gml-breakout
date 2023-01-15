left_wall = collision_line(x, y, 0, y, wall_placeholder_obj, false, true);
right_wall = collision_line(x, y, room_width, y, wall_placeholder_obj, false, true);
left_limit = left_wall.bbox_right + sprite_width / 2;
right_limit = right_wall.bbox_left - sprite_width / 2;