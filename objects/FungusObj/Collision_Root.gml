with (Root) {
    
    if (!invincible) {
        hp -= 1;
        
        invincible = true;
        invincible_timer = invincible_time;
		
		if (hp <= 0) {
			game_over_func()
		}
    }
}

instance_destroy();