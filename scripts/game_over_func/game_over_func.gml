function game_over_func()
{
    audio_stop_all();
    audio_play_sound(GameOver, 10, false);

    if (global.points > global.highscore)
    {
        global.highscore = global.points;

        ini_open("highscore.ini");
        ini_write_real("highscores", "highscore", global.highscore);
        ini_close();
    }

    global.game_over = true;
}