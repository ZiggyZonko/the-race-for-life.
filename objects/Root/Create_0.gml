move_speed = 3;
downward_force = 1.5;

max_hp = 3;
hp = 3;

<<<<<<< HEAD
points = 0;

=======
>>>>>>> a2354ed (First Commit)
level = 1;
points_per_level = 200;

trail_timer = 0;
trail_interval = 3;

trail_spacing = 64; // dis between roots
trail = [];
last_trail_x = x;
last_trail_y = y;

invincible = false;
<<<<<<< HEAD
=======

global.points = 0;
global.highscore = 0;
var _file = "highscore.ini";

if (file_exists(_file)) {
    ini_open(_file);
	show_debug_message("Hellooo")
    global.highscore = ini_read_real("highscores", "highscore", 0);
    ini_close();
}

>>>>>>> a2354ed (First Commit)
invincible_timer = 0;
invincible_time = 60; // 1 second at 60fps

attack_cooldown = 0;