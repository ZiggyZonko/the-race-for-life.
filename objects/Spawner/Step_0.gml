if (global.game_paused) exit;

// --- GET PLAYER ROOT ---
var root = instance_find(Root, 0);

// --- CAMERA INFO ---
var cam = view_camera[0];
var cam_y = camera_get_view_y(cam);
var cam_h = camera_get_view_height(cam);

// --- DETERMINE CURRENT BIOME ---

var downdis = (instance_exists(root)) ? root.y : 0;

var biome_index = floor(downdis / biome_height);
biome_index = clamp(biome_index, 0, array_length(biomes)-1);

current_biome = biomes[biome_index];

// --- BIOME CHANGE DETECTION ---
if (biome_index != current_biome_index)
{
    current_biome_index = biome_index;

    biome_message = "Entering " + biomes[biome_index].name;
    biome_message_timer = 180; // 3 seconds
}

// --- GENERATE NEXT CHUNK ---
if (cam_y + cam_h + 200 > next_chunk_y)
{
    spawn_dirt_chunk(next_chunk_y);
    next_chunk_y += chunk_height_pixels;

	var primary_sprites = [Phosphorus, Nitrate];
	var secondary_sprites = [Zinc, Copper, Iron, Mg];

var biome_nutrients = round(nutrient_count * current_biome.nutrient_bonus);

for (var i = 0; i < biome_nutrients; i++)
{
    var spawn_x = random(room_width);
    var spawn_y = (next_chunk_y - chunk_height_pixels) + random(chunk_height_pixels);

    // 40% primary, 60% secondary (adjust if you want)
    if (random(1) < 0.30)
    {
        var p = instance_create_layer(spawn_x, spawn_y, "Instances", Nutrient_Primary);
        p.sprite_index = primary_sprites[irandom(array_length(primary_sprites)-1)];
    }
    else
    {
        var s = instance_create_layer(spawn_x, spawn_y, "Instances", Nutrient_Secondary);
        s.sprite_index = secondary_sprites[irandom(array_length(secondary_sprites)-1)];
    }
}


   // --- SPAWN ENEMIES ---

var bacteria_count = 1 + floor(downdis / 1500);
bacteria_count = clamp(bacteria_count, 2, 12);

for (var i = 0; i < bacteria_count; i++)
{
	 var spawn_x = random(room_width);
	 var spawn_y = next_chunk_y + random(chunk_height_pixels);

	 // 50/50 split between Bacteria and Fungus
	 var roll = random(1);

	if (roll < current_biome.bacteria_chance) {
		    instance_create_layer(spawn_x, spawn_y, "Instances", Bacteria);
		} else {
		    instance_create_layer(spawn_x, spawn_y, "Instances", FungusObj);
		}
	}
}

// --- CLEANUP OBJECTS ABOVE CAMERA ---
var cleanup_line = cam_y - 300;

with (Nutrient_Primary)
{
    if (y < cleanup_line) instance_destroy();
}

with (Nutrient_Secondary)
{
    if (y < cleanup_line) instance_destroy();
}

with (Bacteria)
{
    if (y < cleanup_line) instance_destroy();
}

if (biome_message_timer > 0)
{
    biome_message_timer--;
}