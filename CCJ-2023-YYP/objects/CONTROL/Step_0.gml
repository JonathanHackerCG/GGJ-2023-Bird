/// @desc CONTROL: Step
event_inherited();

if (keyboard_check_pressed(vk_f1))
{
	V_SOUND = !V_SOUND;
}
if (keyboard_check_pressed(vk_f2))
{
	if (V_MUSIC == 0) { V_MUSIC = 0.4; }
	else { V_MUSIC = 0; }
	audio_sound_gain(AUDIO._music, V_MUSIC, 0);
}
//Updating the card playing queue.
if (timer == -1)
{
	queue.update();
	phase_queue.update();
} else { timer --; }