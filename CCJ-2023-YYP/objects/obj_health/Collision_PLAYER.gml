/// @desc Health Pickup -> PLAYER
event_inherited();

var _hp = heal_amount;
with (PLAYER) { heal(_hp); }
instance_destroy();