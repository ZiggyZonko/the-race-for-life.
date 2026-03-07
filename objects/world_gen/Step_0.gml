var player_depth = obj_player.y;

var needed_chunk = floor(player_depth / (rows_per_chunk * tile_size));

if (needed_chunk > current_chunk)
{
    current_chunk = needed_chunk;

    spawn_dirt_chunk(current_chunk * rows_per_chunk * tile_size);
}