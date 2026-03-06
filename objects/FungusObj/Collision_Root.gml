with (Root) {
    
    if (!invincible) {
        hp -= 1;
        
        invincible = true;
        invincible_timer = invincible_time;
        
<<<<<<< HEAD
        if (hp <= 0) {
            // Game Over ~ more logic here evetually add buttons.
            show_message("The seed has died...");
            game_restart();
        }
=======
		game_over_func()
>>>>>>> a2354ed (First Commit)
    }
}

instance_destroy();