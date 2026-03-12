if (biome_message_timer > 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(-1);
    draw_set_color(c_white);

    draw_text(room_width/2, 120, biome_message);
}

if (global.game_over)
{
    var w = display_get_gui_width();
    var h = display_get_gui_height();

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0,0,w,h,false);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_color(c_white);

    draw_text(w/2, h/2 - 100, "THE SEED HAS DIED");

    draw_text(w/2, h/2 - 40, "Depth Reached: " + string(global.points));
    draw_text(w/2, h/2, "Deepest Root: " + string(global.highscore));

    draw_set_color(c_lime);
    draw_text(w/2, h/2 + 80, "Press R to Grow Again");

    draw_set_color(c_gray);
    draw_text(w/2, h/2 + 120, "Press ESC for Menu");
}