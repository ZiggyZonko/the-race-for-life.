var bar_w = 400;
var bar_h = 20;

var hp_percent = hp / 25;

draw_set_color(c_black);
draw_rectangle(room_width/2 - bar_w/2 -2, 40-2, room_width/2 + bar_w/2 +2, 40+bar_h+2,false);

draw_set_color(c_red);
draw_rectangle(room_width/2 - bar_w/2, 40, room_width/2 - bar_w/2 + bar_w*hp_percent, 40+bar_h,false);

draw_set_color(c_white);
draw_text(room_width/2,20,"Root Guardian");