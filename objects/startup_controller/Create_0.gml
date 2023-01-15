show_debug_overlay(true);
show_debug_message("code_is_compiled " + bool_to_string(code_is_compiled()));

gpu_set_zwriteenable(false);
gpu_set_alphatestenable(false);
// gpu_set_blendenable(false);

randomize();

global.triple_channel = animcurve_get_channel(three_ac, "linear");
global.collision_cache = ds_grid_create(room_width, room_height);

global.ball_pool = ds_stack_create();

var first_ball = instance_find(ball_obj, 0);
for(var i = 1; i < MAX_BALLS; i++) {
	ds_stack_push(global.ball_pool, instance_create_layer(10000, 0, "BallLayer", ball_obj));
}
instance_deactivate_object(ball_obj);
instance_activate_object(first_ball);