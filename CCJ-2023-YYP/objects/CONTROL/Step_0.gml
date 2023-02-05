/// @desc CONTROL: Step
event_inherited();

//Updating the card playing queue.
if (timer == -1)
{
	queue.update();
	phase_queue.update();
} else { timer --; }