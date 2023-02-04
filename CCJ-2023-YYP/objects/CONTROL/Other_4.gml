/// @desc CONTROL: Room Start
event_inherited();

//Make collision layer invisible.
layer_set_visible("Collision", false);

//Convert collision layer into a pathfinding map.
mp_grid_clear_all(collision);
var _tm = layer_tilemap_get_id("Collision");
for (var yy = 0; yy < SCREEN_H / CELLSIZE; yy++) {
for (var xx = 0; xx < SCREEN_W / CELLSIZE; xx++) {
	if (tile_get_index(tilemap_get(_tm, xx, yy)))
	{
		mp_grid_add_cell(collision, xx, yy);
	}
} }