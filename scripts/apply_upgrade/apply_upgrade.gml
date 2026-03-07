function apply_upgrade(up)
{
    var p = Root;

    switch(up)
    {
        case "firerate":
            p.fire_rate -= 5
        break;

        case "maxhp":
            p.max_hp += 1;
            p.hp += 1;
        break;

        case "speed":
            p.move_speed += 0.5;
        break;
		
		case "spawning":
			Spawner.nutrient_count += 1;
		break;
		case "nutrients":
			p.nutrient_multiplier += .1;
		break;
		case "goingdownnnn":
			p.downward_force +=0.5;
    }

    global.game_paused = false;
    instance_destroy(obj_levelup_menu);
}