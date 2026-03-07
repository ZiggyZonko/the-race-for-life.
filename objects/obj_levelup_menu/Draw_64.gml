/// obj_levelup_menu Draw GUI Event

// --- Dim background ---
draw_set_alpha(0.6);
draw_set_colour(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// --- GUI dimensions ---
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// --- Buttons setup ---
button_count = array_length(choices); // instance variable
button_width = gui_w * 0.18;
button_height = gui_h * 0.12;
spacing = gui_w * 0.05;
total_width = button_count * button_width + (button_count - 1) * spacing;
start_x = (gui_w - total_width) / 2;
button_y = gui_h * 0.45;

// --- Draw title ---
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(gui_w / 2, gui_h * 0.35, "LEVEL UP! Choose an Upgrade");

// --- Draw buttons ---
for (var i = 0; i < button_count; i++)
{
    var bx = start_x + i * (button_width + spacing);

    // Draw button rectangle
    draw_set_colour(make_colour_rgb(230,230,230));
    draw_roundrect(bx, button_y, bx + button_width, button_y + button_height, false);

    // Determine text
    var text = "";
    switch(choices[i])
    {
        case "firerate": text = "Faster Fire Rate"; break;
        case "maxhp": text = "+1 Health"; break;
        case "speed": text = "Root Speed"; break;
        case "nutrients": text = "Point Multiplier"; break;
        case "spawning": text = "Increased Nutrients"; break;
        case "goingdownnnn": text = "Down Speed"; break;
    }

    // --- Wrap text manually ---
    var words = string_split(text, " "); // split by spaces
    var lines = [];
    var current_line = "";
    var max_width = button_width * 0.9; // padding

    for (var w = 0; w < array_length(words); w++)
    {
        var test_line = (current_line == "") ? words[w] : current_line + " " + words[w];
        if (string_width(test_line) <= max_width)
        {
            current_line = test_line;
        }
        else
        {
            array_push(lines, current_line);
            current_line = words[w];
        }
    }
    if (current_line != "") array_push(lines, current_line);

    // Compute total text height for vertical centering
    var total_height = 0;
    for (var l = 0; l < array_length(lines); l++)
        total_height += string_height(lines[l]);

    // Starting y
    var text_y = button_y + button_height / 2 - total_height / 2;

    // Draw each line
    draw_set_colour(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);

    for (var l = 0; l < array_length(lines); l++)
    {
        draw_text(bx + button_width / 2, text_y, lines[l]);
        text_y += string_height(lines[l]);
    }
}