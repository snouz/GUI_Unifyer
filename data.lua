data:extend({
	{
		type = "sprite",
		name = "placeables",

		filename = "__Better_Modbuttons__/graphics/icons/placeables.png",
		flags = { "gui-icon" },
		width = 64,
		height = 64,
		scale = 0.5,

		priority = "extra-high-no-scale"
	},
	{
		type = "sprite",
		name = "todolist",

		filename = "__Better_Modbuttons__/graphics/icons/todolist.png",
		flags = { "gui-icon" },
		width = 64,
		height = 64,
		scale = 0.5,

		priority = "extra-high-no-scale"
	},
	{
		type = "sprite",
		name = "calculator",

		filename = "__Better_Modbuttons__/graphics/icons/calculator.png",
		flags = { "gui-icon" },
		width = 32,
		height = 32,
		scale = 1.0,

		priority = "extra-high-no-scale"
	}
})

local slot_button_notext = {
	type = "button_style",
	parent = "slot_button",

	default_font_color = {0, 0, 0, 0},
	hovered_font_color = {0, 0, 0, 0},
	clicked_font_color = {0, 0, 0, 0},
	disabled_font_color = {0, 0, 0, 0},
	selected_font_color = {0, 0, 0, 0},
	selected_hovered_font_color = {0, 0, 0, 0},
	selected_clicked_font_color = {0, 0, 0, 0},
	strikethrough_color = {0, 0, 0, 0},
}

data.raw["gui-style"].default["slot_button_notext"] = slot_button_notext