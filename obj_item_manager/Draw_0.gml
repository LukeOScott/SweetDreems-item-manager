//draw when olny inventory is opened
if inv_open == true 
{
	///---draw item box---///
	i_width = item_text_w + box_border*2;
	i_height = item_text_h + box_border*2;

	//menu background location
	i_x = camera_get_view_x(view_camera[0]) + box_border;
	i_y = camera_get_view_y(view_camera[0]) + box_border;

	//draw the menu background
	draw_sprite_ext(box_spr, box_img, i_x, i_y, i_width/box_width, i_height/box_height, 0, c_white, 1);
	
	
	
	//---draw description---///
	d_width = desc_text_w + box_border*2;
	d_height = desc_text_h + box_border*2;
	
	//menu background location
	d_x = camera_get_view_x(view_camera[0]) + box_border + desc_x;
	d_y = camera_get_view_y(view_camera[0]) + box_border;

	//draw the menu background
	draw_sprite_ext(box_spr, box_img, d_x, d_y, d_width/box_width, d_height/box_height, 0, c_white, 1);



	//fonts
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);

	for (var i = 0; i < array_length(inv); i++)
	{
		var _xx = camera_get_view_x(view_camera[0]) + screen_bord;
		var _yy = camera_get_view_y(view_camera[0]) + screen_bord;
		var _dx = camera_get_view_x(view_camera[0]) + desc_x + screen_bord;
		var _dy = camera_get_view_y(view_camera[0]) + screen_bord;
		var _sep = sep;
		var _col = c_white;
	
		//draw icon
		draw_sprite(inv[i].sprite, 0, _xx, _yy + _sep*i);

		//get "selected" color
		if selected_item == i { _col = c_yellow;}
		draw_set_color(_col);

		//draw text
		draw_text(_xx + 16, _yy + _sep*i, inv[i].name);

		//description
		if selected_item == i
		{
		draw_text_ext(_dx, _dy, inv[i].description, 12, 80);
		}

		//reset color to white
		draw_set_color(c_white);
	}
	
	inv_drawed = true;
	
	//dynamically get the width of option
	var _new_w = 0;
	for(var i = 0; i < op_length; i++)
	{
		var _op_w = string_width(option[i]);
		_new_w = max(_new_w, _op_w);
	}
	
	//use options
	if item_selected == true
	{
		
		//---draw option---///
		o_width = _new_w + box_border*2;
		o_height = op_text_h + box_border*2;
	
		//menu background location
		o_x = camera_get_view_x(view_camera[0]) + box_border + desc_x;
		o_y = camera_get_view_y(view_camera[0]) + box_border + op_y;

		//draw the menu background
		draw_sprite_ext(box_spr, box_img, o_x, o_y, o_width/box_width, o_height/box_height, 0, c_white, 1);
	
		//draw option text
		for(var i = 0; i < op_length; i++)
		{
			var _ox = camera_get_view_x(view_camera[0]) + screen_bord + desc_x;
			var _oy = camera_get_view_y(view_camera[0]) + screen_bord + op_y;
			var _c = c_white;
			if op_pos == i {_c = c_yellow};
			draw_text_color(_ox, _oy + sep*i, option[i], _c, _c, _c, _c, 1);
		}
		
		option_drawed = true;
	
	}

}

/*
//for debug
if inv_open == true
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 80, "inv_open = true", c_white, c_white, c_white, c_white, 1);
}
if inv_open == false
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 80, "inv_open = false", c_white, c_white, c_white, c_white, 1);
}
if inv_drawed == true
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 90, "inv_drawed = true", c_white, c_white, c_white, c_white, 1);
}
if inv_drawed == false
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 90, "inv_drawed = false", c_white, c_white, c_white, c_white, 1);
}
if item_selected == true
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 100, "item_selected = true", c_white, c_white, c_white, c_white, 1);
}
if item_selected == false
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 100, "item_selected = false", c_white, c_white, c_white, c_white, 1);
}
if option_drawed == true
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 110, "option_drawed = true", c_white, c_white, c_white, c_white, 1);
}
if option_drawed == false
{
	draw_text_color(camera_get_view_x(view_camera[0]) + 20, camera_get_view_y(view_camera[0]) + 110, "option_drawed = false", c_white, c_white, c_white, c_white, 1);
}
*/