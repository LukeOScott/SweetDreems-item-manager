//get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);
pause_key = keyboard_check_pressed(vk_escape);

// get selected item
//store number of options
inv_length = array_length(inv);

if inv_open == false{inv_drawed = false;} 
if item_selected == false{option_drawed = false;}

//move through menu
if inv_open == true && inv_drawed == true && item_selected == false
{
	selected_item += down_key - up_key;
	if selected_item >= inv_length {selected_item = 0};
	if selected_item < 0 {selected_item = inv_length-1};
	
	//use an item
	if accept_key
	{
		item_selected = true;
		//inv[selected_item].effect();
	}
	
	/*
	//drop the item
	if drop_key && inv[selected_item].can_drop == true
	{
		//get rid of the item
		array_delete(inv, selected_item, 1);
	}
	*/
}

//use option
if item_selected == true
{
	//store number of options
	op_length = array_length(option);

	//move through menu
	op_pos += down_key - up_key;
	if op_pos >= op_length {op_pos = 0};
	if op_pos < 0 {op_pos = op_length-1};

	//using the options
	if accept_key && option_drawed == true
	{
		
		switch(op_pos)
		{
			//back
			case 0: item_selected = false; op_pos = 0; break;
			//use
			case 1: inv[selected_item].effect(); item_selected = false; op_pos = 0; break;
			//drop
			case 2: if inv[selected_item].can_drop == true{array_delete(inv, selected_item, 1)}; item_selected = false; op_pos = 0; break;
		}
			
	
		//correct option length
		op_length = array_length(option);
	}

	if pause_key
	{
		instance_destroy(obj_pause_menu);
		Close_inv();
	}
}