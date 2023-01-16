if (mouse_check_button_pressed(mb_right)) {
	ball_triple();
}

if (mouse_check_button_pressed(mb_left)) {
	with(wall_placeholder_obj) {
		if (y >= 1048) {
			instance_destroy();
		}
	}
}

//if (mouse_check_button_pressed(mb_left)) {
//	fps_sum = 0;
//	fps_duration = 0;
//	show_debug_message("Pressed {0} {1}", fps_sum, fps_duration);
//}

//if (mouse_check_button(mb_left)) {
//	fps_sum += fps_real;
//	fps_duration += 1;
//	show_debug_message("Held {0} {1}", fps_sum, fps_duration);
//}

//if (mouse_check_button_released(mb_left)) {
//	show_debug_message("Released {0} {1}", fps_sum, fps_duration);
//}