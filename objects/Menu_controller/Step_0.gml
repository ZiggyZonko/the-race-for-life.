var mx = mouse_x;
var my = mouse_y;

// --- BUTTON BOUNDS ---

var play_left   = room_width/2 - button_width/2;
var play_right  = room_width/2 + button_width/2;
var play_top    = button_play_y - button_height/2;
var play_bottom = button_play_y + button_height/2;

var quit_left   = room_width/2 - button_width/2;
var quit_right  = room_width/2 + button_width/2;
var quit_top    = button_quit_y - button_height/2;
var quit_bottom = button_quit_y + button_height/2;

var git_left   = room_width/2 - button_width/2;
var git_right  = room_width/2 + button_width/2;
var git_top    = button_github_y - button_height/2;
var git_bottom = button_github_y + button_height/2;

// --- HOVER DETECTION ---
play_hover   = (mx > play_left && mx < play_right && my > play_top && my < play_bottom);
quit_hover   = (mx > quit_left && mx < quit_right && my > quit_top && my < quit_bottom);
github_hover = (mx > git_left && mx < git_right && my > git_top && my < git_bottom);

// --- CLICK HANDLING ---
// --- CLICK HANDLING ---
if (mouse_check_button_pressed(mb_left))
{
    // ======================
    // WHEN CREDITS ARE OPEN
    // ======================
    if (show_credits)
    {
        // Close button bounds
        var close_left   = room_width/2 + 200;
        var close_right  = room_width/2 + 230;
        var close_top    = room_height/2 - 180;
        var close_bottom = room_height/2 - 150;

        // GitHub link bounds
        var link_left  = room_width/2 - 160;
        var link_right = room_width/2 + 160;
        var link_top   = room_height/2 + 80;
        var link_bot   = room_height/2 + 120;

        github_link_hover = (mx > link_left && mx < link_right && my > link_top && my < link_bot);

        // CLOSE BUTTON
        if (mx > close_left && mx < close_right && my > close_top && my < close_bottom)
        {
            show_credits = false;
        }

        // OPEN GITHUB
        if (github_link_hover)
        {
            url_open(github_url);
        }
    }

    // ======================
    // NORMAL MENU
    // ======================
    else
    {
        if (play_hover)
        {
            room_goto(MainGame);
            audio_play_sound(Music, 10, true);
        }

        if (quit_hover)
        {
            game_end();
        }

        if (github_hover)
        {
            show_credits = true;
        }
    }
}

title_wave += 0.03;