show_debug_overlay(true);
show_debug_message("code_is_compiled " + bool_to_string(code_is_compiled()));
randomize();

global.collision_cache = ds_grid_create(room_width, room_height);
global.checks = 0;