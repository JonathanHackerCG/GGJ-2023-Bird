/// Game Over: Draw
event_inherited();

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_text_ext(SCREEN_W / 2, SCREEN_H / 2, text, 32, SCREEN_W - 480);