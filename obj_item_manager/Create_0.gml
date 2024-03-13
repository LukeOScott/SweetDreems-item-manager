depth = -9999;

	//item constructor
function create_item(_name, _desc, _b_price, _s_price, _spr, _can_drop, _effect) constructor
	{
		name = _name;
		description = _desc;
		buy_price = _b_price;
		sell_price = _s_price;
		sprite = _spr;
		can_drop = _can_drop; 
		effect = _effect;
	}


//Japanese create the items
global.item_list =
	{

		sweet_burger : new create_item(
			"スイートバーガー",
			"あまそうな バーガーだ！ 30HP かいふく する",
			30,
			20,
			spr_sweet_burger,
			true,
			
			function()
				{
				obj_player.hp += 30;
				
				//get rid of the item
				array_delete(inv, selected_item, 1);
				}
			
			),
			
		kitty_kat : new create_item(
			"キッティカット",
			"2つに われて それぞれ 11HP かいふく する",
			22,
			15,
			spr_kitty_kat,
			true,
			
			function()
				{
				obj_player.hp += 11;
				
				//get rid of the item
				array_delete(inv, selected_item, 1);
				
				//add half kitty kat
				array_insert(inv, selected_item, global.item_list.kitty_kat_half)
				}
			
			),
			
		kitty_kat_half : new create_item(
			"キッティカット はんぶん",
			"われている。 11HP かいふく。",
			11,
			7,
			spr_kitty_kat_half,
			true,
			
			function()
				{
				obj_player.hp += 10;
				
				//get rid of the item
				array_delete(inv, selected_item, 1);
				}
			
			),
		
		haribomb : new create_item(
			"ハリボム",
			"ばくはつせいの くまのぐみだ。 ん？ いやな よかんがする",
			30,
			20,
			spr_haribomb,
			true,
			
			function()
				{	
					instance_create_depth(obj_player.x, obj_player.y, 0, obj_haribomb_weapon);
					
					//get rid of the item
					array_delete(inv, selected_item, 1);
				}
			
			),
			
		pinkkey : new create_item(
			"ピンクのかぎ",
			"ピンクの ドアを あける。 (いちどだけ)",
			100,
			70,
			spr_pinkkey,
			false,
			
			function()
			{
				var _used = false;
				
				if instance_exists(obj_pink_door)
				{
					with(obj_pink_door)
					{
						if distance_to_object(obj_player) < 20 
						{
							instance_destroy();
							_used = true;
						}
					}
				}
				
				//get rid of the item
				if _used == true
				{
					array_delete(inv, selected_item, 1);
				}
			}
			
		),
		
		
		
	}
	
//create inventory
inv = array_create(0);

inv_max = 10;
selected_item = 0;
inv_length = 0;

	
//for drawing and mouse position
sep = 16;
screen_bord = 16;

//for check if you open the inventory box
inv_open = false;
inv_drawed = false;
option_drawed = false;
item_selected = false;

//item box setting
item_text_w = 140;
item_text_h = 160;
box_border = 8;

desc_text_w = 80;
desc_text_h = 60;
desc_x = 160;

//op setting
//op_text_w = 24; // no need this but maybe using it later
op_text_h = 44;
op_y = 80;


//do not change unless you change the text-box-sprite's width, height, img, etc. 
box_width = 40;
box_height = 40;

box_spr = spr_textbox;
box_img = 0;

//option var
op_pos = 0;
op_length = 0;

//when selected, draw option
option[0] = global.textBack;
option[1] = global.textUse;
option[2] = global.textDrop; 
