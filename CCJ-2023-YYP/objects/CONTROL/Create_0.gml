/// @desc CONTROL: Create
event_inherited();

#macro CELLSIZE 32
#macro SCREEN_W 1920
#macro SCREEN_H 1080
collision = mp_grid_create(0, 0, SCREEN_W / CELLSIZE, SCREEN_H / CELLSIZE, CELLSIZE, CELLSIZE);

room_goto(rm_template);