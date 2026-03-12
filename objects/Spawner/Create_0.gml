/// --- obj_spawner Create Event ---

tile_size = 64;
chunk_height_pixels = 640;
rows_per_chunk = chunk_height_pixels div tile_size;
cols_per_chunk = ceil(room_width / tile_size);

dirt_layer_id = layer_get_id("Tiles_Dirt");
dirt_tilemap = layer_tilemap_get_id(dirt_layer_id);

enemy_spawn_timer = 0;
enemy_spawn_interval = 120;
nutrient_spawn_timer = 0;
nutrient_spawn_interval = 180;

nutrient_count = 5;


/// --- BIOME DEFINITIONS ---

biomes = [
    {
        name: "Topsoil",
        tile: DirtTileset,
        bacteria_chance: 0.8,
        fungus_chance: 0.2,
        nutrient_bonus: 1.0
    },
    {
        name: "Rock",
        tile: StoneTileset,
        bacteria_chance: 0.4,
        fungus_chance: 0.6,
        nutrient_bonus: 0.6
    },
    {
        name: "Deep Soil",
        tile: DeepSoil,
        bacteria_chance: 0.3,
        fungus_chance: 0.7,
        nutrient_bonus: 1.2
    }
];

biome_height = 10000;


// --- TILEMAPS ---
tilemap_topsoil = layer_tilemap_get_id("Topsoil_Layer");
tilemap_clay = layer_tilemap_get_id("Clay_Layer");
tilemap_rock = layer_tilemap_get_id("Rock_Layer");
tilemap_deep = layer_tilemap_get_id("Deep_Layer");


// --- FIRST CHUNK SPAWN ---
next_chunk_y = 384 + 16;
spawn_dirt_chunk(next_chunk_y);
next_chunk_y += chunk_height_pixels;
// --- BIOME UI ---
current_biome_index = -1;
biome_message = "";
biome_message_timer = 0;

//Boss
global.boss_spawned = false
global.game_over = false;
global.boss_defeated = false;
boss_depth = 7500;
boss_warning_timer = 0

shake_timer = 0;
shake_strength = 0;
pointsgiven = 0;