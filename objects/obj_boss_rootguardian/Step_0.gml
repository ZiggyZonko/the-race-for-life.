if (!instance_exists(target)) exit;

var player = instance_find(Root,0);

if (!instance_exists(player)) exit;

y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 150;

if (instance_exists(player))
{
    var dirp = point_direction(x,y,player.x,player.y);

    x += lengthdir_x(move_speed,dirp);
    y += lengthdir_y(move_speed,dirp);

    // damage player on contact
    if (place_meeting(x,y,Root))
    {
        with (player)
        {
            hp -= 1;
        }
    }
}

sway_timer += sway_speed;

x = base_x + sin(sway_timer) * sway_distance;

shoot_timer++;

if (shoot_timer >= shoot_delay)
{
    shoot_timer = 0;

    if (instance_exists(player))
    {
        var base_dir = point_direction(x,y,player.x,player.y);

        for (var i = -1; i <= 1; i++)
        {
            var spore = instance_create_layer(x, y-40, "Instances", boss_projectile);

            spore.direction = base_dir + i * 35;
            spore.speed = 5;
        }
    }
}

if (hp <= 0)
{
    global.boss_spawned = false;
    global.boss_defeated = true;

    instance_destroy();
}