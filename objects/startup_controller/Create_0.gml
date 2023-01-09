show_debug_overlay(true);
show_debug_message("code_is_compiled " + bool_to_string(code_is_compiled()));
randomize();
gpu_set_zwriteenable(false);
// gpu_set_blendenable(false);
gpu_set_alphatestenable(false);

global.collision_cache = ds_grid_create(room_width, room_height);
global.checks = 0;