/// @desc Pickup: Create
event_inherited();

savekey = SAVE.make_key(id);
if (SAVE.check(savekey))
{
	instance_destroy();
}