show_debug_overlay(true);
show_debug_message("code_is_compiled " + bool_to_string(code_is_compiled()));

gpu_set_zwriteenable(false);
gpu_set_alphatestenable(false);
// gpu_set_blendenable(false);

randomize();

global.triple_channel = animcurve_get_channel(three_ac, "linear");
global.collision_cache = ds_grid_create(room_width, room_height);

global.ball_pool = array_create(MAX_BALLS);
global.ball_free_indices = ds_stack_create();
global.balls_active = 0;

var first_ball = instance_find(ball_obj, 0);
first_ball.index = 0;
global.ball_pool[0] = first_ball;
global.balls_active++;

for(var i = 1; i < MAX_BALLS; i++) {
	global.ball_pool[i] = instance_create_layer(0, 10000, "BallLayer", ball_obj);
	global.ball_pool[i].index = i;
	ds_stack_push(global.ball_free_indices, i);
}