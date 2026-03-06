with (Root) {
    
    if (!invincible) {
        hp -= 1;
<<<<<<< HEAD
        
        invincible = true;
        invincible_timer = invincible_time;
        
        if (hp <= 0) {
			audio_play_sound(GameOver, 10, false);
            show_message("The seed has died...");
            game_restart();
        }
=======
		
		invincible = true;
        invincible_timer = invincible_time;
>>>>>>> a2354ed (First Commit)
    }
}

instance_destroy();