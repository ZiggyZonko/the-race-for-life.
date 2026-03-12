draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// dark overlay background
draw_set_color(make_color_rgb(10,10,10));
draw_set_alpha(0.85);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
draw_set_alpha(1);


// ---- TITLE ----
var title_y = room_height/3 + sin(title_wave) * 6;

draw_set_color(c_black);
draw_text(room_width/2 + 3, title_y + 3, title_text);

draw_set_color(c_lime);
draw_text(room_width/2, title_y, title_text);


// ---- PLAY BUTTON ----
var play_color = play_hover ? make_color_rgb(80,200,120) : make_color_rgb(40,120,70);

draw_set_color(play_color);
draw_roundrect(
    room_width/2 - button_width/2,
    button_play_y - button_height/2,
    room_width/2 + button_width/2,
    button_play_y + button_height/2,
    false
);

draw_set_color(c_white);
draw_text(room_width/2, button_play_y, "PLAY");


// ---- QUIT BUTTON ----
var quit_color = quit_hover ? make_color_rgb(200,80,80) : make_color_rgb(120,40,40);

draw_set_color(quit_color);
draw_roundrect(
    room_width/2 - button_width/2,
    button_quit_y - button_height/2,
    room_width/2 + button_width/2,
    button_quit_y + button_height/2,
    false
);

draw_set_color(c_white);
draw_text(room_width/2, button_quit_y, "QUIT");


// ---- GITHUB BUTTON ----
var git_color = github_hover ? make_color_rgb(120,120,220) : make_color_rgb(70,70,140);

draw_set_color(git_color);
draw_roundrect(
    room_width/2 - button_width/2,
    button_github_y - button_height/2,
    room_width/2 + button_width/2,
    button_github_y + button_height/2,
    false
);

draw_set_color(c_white);
draw_text(room_width/2, button_github_y, "GITHUB / CREDITS");


// ---- CREDITS WINDOW ----
// ---- CREDITS WINDOW ----
if (show_credits)
{
    draw_set_alpha(0.9);
    draw_set_color(c_black);
    draw_rectangle(room_width/2 - 240, room_height/2 - 200,
                   room_width/2 + 240, room_height/2 + 200, false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_text(room_width/2, room_height/2 - 140, "CREDITS");

    draw_set_color(c_white);
    draw_text(room_width/2, room_height/2 - 80, "Game Design & Programming");
    draw_text(room_width/2, room_height/2 - 50, "Phi Duck");

    draw_text(room_width/2, room_height/2 - 10, "Artwork");
    draw_text(room_width/2, room_height/2 + 20, "Terrence Wu");

    draw_text(room_width/2, room_height/2 + 70, "GitHub");

    // clickable link
    if (github_link_hover)
        draw_set_color(c_aqua);
    else
        draw_set_color(c_lime);

    draw_text(room_width/2, room_height/2 + 100, github_url);

    // close button
    draw_set_color(c_red);
    draw_rectangle(room_width/2 + 200, room_height/2 - 180,
                   room_width/2 + 230, room_height/2 - 150, false);

    draw_set_color(c_white);
    draw_text(room_width/2 + 215, room_height/2 - 165, "X");
	
	var close_hover =
    mouse_x > room_width/2 + 200 &&
    mouse_x < room_width/2 + 230 &&
    mouse_y > room_height/2 - 180 &&
    mouse_y < room_height/2 - 150;

	draw_set_color(close_hover ? c_orange : c_red);
}