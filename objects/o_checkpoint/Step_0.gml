/// @description On player overlap, change animation and set player last checkpoint

if (block_collides_with_others(id, o_player) && (id != o_player.last_checkpoint) ) {
	id.sprite_index = s_checkpoint_active;
	if (o_player.last_checkpoint != noone)
		o_player.last_checkpoint.sprite_index = s_checkpoint_idle;
	o_player.last_checkpoint = id;
}