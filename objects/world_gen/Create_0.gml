// tile size
tile_size = 32;

// chunk size
rows_per_chunk = 12;
cols_per_chunk = room_width div tile_size;

// biome depth
biome_height = 3000;

// get tilemap IDs
tilemap_topsoil = layer_tilemap_get_id("Topsoil_Layer");
tilemap_clay = layer_tilemap_get_id("Clay_Layer");
tilemap_rock = layer_tilemap_get_id("Rock_Layer");
tilemap_deep = layer_tilemap_get_id("Deep_Layer");

// chunk tracking
current_chunk = 0;

// generate starting ground
spawn_dirt_chunk(0);