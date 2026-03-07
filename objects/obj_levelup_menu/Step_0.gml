var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var button_count = array_length(choices);

var button_width = gui_w * 0.18;
var button_height = gui_h * 0.12;

var spacing = gui_w * 0.05;

var total_width = button_count * button_width + (button_count - 1) * spacing;
var start_x = (gui_w - total_width) / 2;

var button_y = gui_h * 0.45;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left))
{
    for (var i = 0; i < button_count; i++)
    {
        var bx = start_x + i * (button_width + spacing);

        if (point_in_rectangle(mx,my,bx,button_y,bx+button_width,button_y+button_height))
        {
            apply_upgrade(choices[i]);
            global.game_paused = false;
            instance_destroy();
        }
    }
}