if (mouse_check_button_pressed(mb_right)) {
	ball_triple();
}

if (!started && mouse_check_button_pressed(mb_left)) {
	started = true;
	global.ball_pool[0].speed = BALL_SPEED;
}