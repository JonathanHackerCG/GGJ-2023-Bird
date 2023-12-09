/// @desc Pickup: Draw
event_inherited();

draw_sprite(spr_pickup_shadow, 0, x, y);
draw_sprite_animated(sprite_index, x, y + (animate_sin(30) * 4) - 16);