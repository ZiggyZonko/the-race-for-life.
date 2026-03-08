y -= speed;

if (y < camera_get_view_y(view_camera[0]) - 100)
{
    instance_destroy();
}