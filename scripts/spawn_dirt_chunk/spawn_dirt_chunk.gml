function spawn_dirt_chunk(chunk_y)
{
    var start_row = floor(chunk_y / tile_size);

    // determine biome based on depth
    var biome_index = floor(chunk_y / biome_height);
    biome_index = clamp(biome_index, 0, array_length(biomes)-1);

    var active_tilemap;

    switch (biome_index)
    {
        case 0:
            active_tilemap = tilemap_topsoil;
        break;

        case 1:
            active_tilemap = tilemap_rock;
        break;

        case 2:
            active_tilemap = tilemap_deep;
        break;

        default:
            active_tilemap = tilemap_deep;
        break;
    }

    for (var r = 0; r < rows_per_chunk; r++)
    {
        for (var c = 0; c < cols_per_chunk; c++)
        {
            var tile_index = choose(1,2);

            tilemap_set(active_tilemap, tile_index, c, start_row + r);

            var tile_x = c * tile_size + tile_size/2;
            var tile_y = (start_row + r) * tile_size + tile_size/2;

            instance_create_layer(tile_x, tile_y, "Instances", obj_dirt_block);
        }
    }
}