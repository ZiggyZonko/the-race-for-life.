if (global.game_paused || global.game_over) exit;
life--;

if (life <= 0)
    instance_destroy();