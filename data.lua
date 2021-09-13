local ICONPATH = "__GUI_Unifyer__/graphics/icons/"
local GUIPATH = "__GUI_Unifyer__/graphics/gui/"

local sprites = {"placeables_button", "todolist_button", "helmod_button", "factoryplanner_button", "moduleinserter_button", "wiiuf_button", "creativemod_button", "beastfinder_button",
"blueprintrequest_button", "bobclasses_button", "bobinserters_button", "cleanmap_button", "deathcounter_button", "ingteb_button", "outpostplanner_button",
"quickbarimportexport_button", "quickbarimport_button", "quickbarexport_button", "rocketsilostats_button", "schall_sc_button",

"actr_button", "attachnotes_button", "attilazoommod_button", "avatars_button", "betterbotsfixed_button", "blackmarket1_button", "blackmarket2_button",
"changemapsettings_button", "dana_button", "deleteadjacentchunk_button", "doingthingsbyhand_button",
"facautoscreenshot_button", "factorissimo2_button", "factorissimo2_inspect_button", "killlostbots_button",
"kttrrc_button", "kuxcraftingtools_button", "kuxorbitalioncannon_button", "landfilleverythingu_button",
"markers_button", "modmashsplinterboom_button", "modmashsplinternewworlds_button", "notenoughtodo_button",
"oshahotswap_button", "picksrocketstats_button", "poweredentities_button", "researchcounter_button",
"richtexthelper_button", "ritnteleportation_button", "solarcalc_button",
"spacemod_button",
"thefatcontroller_button", "trainlog_button", "trainpubsub_button", "upgradeplannernext_button", "whatsmissing_button", "schall_rc_button",
"commuguidemod_guide_button", "commuguidemod_pupil_button", "blueprint_flip_horizontal_button", "blueprint_flip_vertical_button", "fjei_button",

"248k_button", "blueprintalignment_button", "cargotrainmanager_button", "clusterio_button", "cursedexp_button", "defaultwaitconditions_button",
"diplomacy_button", "electronic_locomotives_button", "forces_button", "hive_mind_button1", "hive_mind_button2", "howfardiditgo_button", "kuxblueprinteditor_button",
"logisticmachines_button", "logisticrequestmanager_button", "regioncloner_button", "resetevolutionpollution_button",
"schalloreconversion_button", "shuttle_train_continued_button", "simple_circuit_trains_button", "smartchest_button", "teamcoop_button1", "teamcoop_button2", "trainschedulesignals_button",

"homeworld_redux_button", "mlawfulevil_button", "trashcan_button", "pycoalprocessing_button", "usagedetector_button", "rpg_button", "spawncontrol_button", "spawncontrol_random_button",
"advancedlogisticssystemfork_button", "timeline_button", "somezoom_out_button", "somezoom_in_button", "productionmonitor_button", "teleportation_redux_button",
"newgameplus_button", "nullius_button", "inserterthroughput_on_button", "inserterthroughput_off_button",
}

for _, i in pairs(sprites) do
	local p = {}
	p.type = "sprite"
	p.name = i
	p.filename = ICONPATH .. i .. ".png"
	p.flags = { "gui-icon" }
	p.width = 64
	p.height = 64
	p.scale = 0.5
	p.priority = "extra-high-no-scale"
	data:extend({p})
end

--Autotrash
if data.raw["sprite"]["autotrash_trash"] and data.raw["sprite"]["autotrash_trash_paused"] and data.raw["sprite"]["autotrash_requests_paused"] and data.raw["sprite"]["autotrash_both_paused"] then
	data.raw["sprite"]["autotrash_trash"].filename = ICONPATH .. "autotrash_button.png"
	data.raw["sprite"]["autotrash_trash_paused"].layers[1].filename = ICONPATH .. "autotrash_button.png"
	data.raw["sprite"]["autotrash_requests_paused"].layers[1].filename = ICONPATH .. "autotrash_button.png"
	data.raw["sprite"]["autotrash_both_paused"].layers[1].filename = ICONPATH .. "autotrash_button.png"
end

--TogglePeacefulMode
if data.raw["sprite"]["tpm_button_sprite_peace"] and data.raw["sprite"]["tpm_button_sprite_war"] then
	data.raw["sprite"]["tpm_button_sprite_peace"].filename = ICONPATH .. "tpm_button_sprite_peace.png"
	data.raw["sprite"]["tpm_button_sprite_peace"].size = {64, 64}
	data.raw["sprite"]["tpm_button_sprite_war"].filename = ICONPATH .. "tpm_button_sprite_war.png"
	data.raw["sprite"]["tpm_button_sprite_war"].size = {64, 64}
end





if mods["SchallEndgameEvolution"] then
	local max_tier = settings.startup["endgameevolution-alien-tier-max"] and settings.startup["endgameevolution-alien-tier-max"].value or 20
	for i = 1,max_tier do
		local p = {}
		local whiteness = (((max_tier + 2) - i) / (max_tier + 2))
		p.type = "sprite"
		p.name = "sprite-Schall-tier-"..i
		p.layers = {
			{filename = ICONPATH .. "schallendgameevolution_button.png", size = 64, scale = 0.5, tint = {1, whiteness, whiteness}},
			{filename = "__SchallEndgameEvolution__/graphics/gui/tier-"..i..".png", size = 32, scale = 0.7}
		}
		p.flags = { "gui-icon" }
		p.priority = "extra-high-no-scale"
		data:extend({p})
	end
end

------------------
-- BUTTON STYLE --
------------------

local nothing = {0, 0, 0, 0}
local white = {1, 1, 1, 0.9}
local black = {0, 0, 0, 0.9}
local slot_button_notext = {
	type = "button_style",
	parent = "slot_button",
	default_font_color = nothing,
  hovered_font_color = nothing,
	clicked_font_color = nothing,
	disabled_font_color = nothing,
	selected_font_color = nothing,
	selected_hovered_font_color = nothing,
	selected_clicked_font_color = nothing,
	strikethrough_color = nothing,
}
data.raw["gui-style"].default["slot_button_notext"] = slot_button_notext

local slot_button_whitetext = {
	type = "button_style",
	parent = "slot_button",
	default_font_color = white,
	hovered_font_color = white,
	clicked_font_color = white,
	disabled_font_color = white,
	selected_font_color = white,
	selected_hovered_font_color = white,
	selected_clicked_font_color = white,
	strikethrough_color = white,
}
data.raw["gui-style"].default["slot_button_whitetext"] = slot_button_whitetext

local slot_sized_button_notext = {
	type = "button_style",
	parent = "slot_sized_button",
	default_font_color = nothing,
	hovered_font_color = nothing,
	clicked_font_color = nothing,
	disabled_font_color = nothing,
	selected_font_color = nothing,
	selected_hovered_font_color = nothing,
	selected_clicked_font_color = nothing,
	strikethrough_color = nothing,
}
data.raw["gui-style"].default["slot_sized_button_notext"] = slot_sized_button_notext

local slot_sized_button_blacktext = {
	type = "button_style",
	parent = "slot_sized_button",
	default_font_color = black,
	hovered_font_color = black,
	clicked_font_color = black,
	disabled_font_color = black,
	selected_font_color = black,
	selected_hovered_font_color = black,
	selected_clicked_font_color = black,
	strikethrough_color = black,
}
data.raw["gui-style"].default["slot_sized_button_blacktext"] = slot_sized_button_blacktext

local slot_button_notext_transparent =
{
  type = "button_style",
  parent = "slot_button_notext",
  draw_shadow_under_picture = true,
  size = 40,
  padding = 0,
  default_graphical_set =
  {
    base = {border = 5, position = {0, 736}, size = 80, opacity = 0.4},
    shadow = offset_by_2_rounded_corners_glow({15, 7, 3, 100})
  },
  hovered_graphical_set =
  {
    base = {border = 5, position = {80, 736}, size = 80, opacity = 0.4},
    shadow = offset_by_2_rounded_corners_glow({15, 7, 3, 100}),
    glow = offset_by_2_rounded_corners_glow({225, 177, 106, 255})
  },
  clicked_graphical_set =
  {
    base = {border = 5, position = {160, 736}, size = 80, opacity = 0.4},
    shadow = offset_by_2_rounded_corners_glow({15, 7, 3, 100})
  },
  selected_graphical_set =
  {
    base = {border = 5, position = {80, 736}, size = 80, opacity = 0.4},
    shadow = offset_by_2_rounded_corners_glow({15, 7, 3, 100})
  },
  selected_hovered_graphical_set =
  {
    base = {border = 5, position = {80, 736}, size = 80, opacity = 0.4},
    shadow = offset_by_2_rounded_corners_glow({15, 7, 3, 100}),
    glow = offset_by_2_rounded_corners_glow({225, 177, 106, 255})
  },
  selected_clicked_graphical_set =
  {
    base = {border = 5, position = {160, 736}, size = 80, opacity = 0.4},
    shadow = offset_by_2_rounded_corners_glow({15, 7, 3, 100})
  },
  pie_progress_color = {0.98, 0.66, 0.22, 0.5},
}
data.raw["gui-style"].default["slot_button_notext_transparent"] = slot_button_notext_transparent

local slot_button_notext_transparent_selected =
{
  type = "button_style",
  parent = "slot_button_notext_transparent",
  default_graphical_set =
  {
    base = {border = 5, position = {0, 736}, size = 80, opacity = 0.4},
    shadow = offset_by_2_rounded_corners_glow({15, 7, 3, 100})
  },
}
data.raw["gui-style"].default["slot_button_notext_transparent_selected"] = slot_button_notext_transparent_selected

local function make_button_style(stylename, filename, imgsize, border, opacity)
  data.raw["gui-style"].default[stylename] = {
    type = "button_style",
    parent = "slot_button_notext",
    draw_shadow_under_picture = true,
    size = (imgsize / 2),
    padding = 0,
    default_graphical_set =           { base = {type = "composition", filename = filename, border = border, position = {0, 0}, size = imgsize, opacity = opacity}, },
    hovered_graphical_set =           { base = {type = "composition", filename = filename, border = border, position = {imgsize, 0}, size = imgsize, opacity = opacity}, },
    selected_graphical_set =          { base = {type = "composition", filename = filename, border = border, position = {imgsize, 0}, size = imgsize, opacity = opacity}, },
    selected_hovered_graphical_set =  { base = {type = "composition", filename = filename, border = border, position = {imgsize, 0}, size = imgsize, opacity = opacity}, },
    selected_clicked_graphical_set =  { base = {type = "composition", filename = filename, border = border, position = {(imgsize * 2), 0}, size = imgsize, opacity = opacity}, },
    clicked_graphical_set =           { base = {type = "composition", filename = filename, border = border, position = {(imgsize * 2), 0}, size = imgsize, opacity = opacity}, },
  }
  data.raw["gui-style"].default[stylename .. "_selected"] = {
    type = "button_style",
    parent = stylename,
    default_graphical_set =           { base = {type = "composition", filename = filename, border = border, position = {(imgsize * 2), 0}, size = imgsize, opacity = opacity}, },
  }
end

make_button_style("gui_unifyer_gui_01", GUIPATH .. "gui_unifyer_gui_01.png", 80, 5, 1)
make_button_style("gui_unifyer_gui_02", GUIPATH .. "gui_unifyer_gui_02.png", 80, 5, 1)
make_button_style("gui_unifyer_gui_03", GUIPATH .. "gui_unifyer_gui_03.png", 80, 5, 0.9)
make_button_style("gui_unifyer_gui_04", GUIPATH .. "gui_unifyer_gui_04.png", 80, 5, 0.9)
make_button_style("gui_unifyer_gui_05", GUIPATH .. "gui_unifyer_gui_05.png", 80, 5, 0.8)
make_button_style("gui_unifyer_gui_06", GUIPATH .. "gui_unifyer_gui_06.png", 80, 7, 0.8)
make_button_style("gui_unifyer_gui_07", GUIPATH .. "gui_unifyer_gui_07.png", 80, 5, 1)
make_button_style("gui_unifyer_gui_08", GUIPATH .. "gui_unifyer_gui_08.png", 80, 8, 0.9)





--data.raw["gui-style"].default["attach-notes-add-button"]
--data.raw["gui-style"].default["attach-notes-edit-button"]
--data.raw["gui-style"].default["attach-notes-view-button"]

------------------
-- FRAME STYLES --
------------------

local snouz_invisible_frame =
{
  type = "frame_style",
  use_header_filler = false,
  padding = 0,
  margin = 0,
  graphical_set =
  {
    base =
    {
      position = {0, 0},
      corner_size = 1,
      center = {position = {42, 8},
      size = {1, 1}},
      draw_type = "outer",
      opacity = 0,
    },
  },
  header_flow_style =
  {
    type = "horizontal_flow_style",
    bottom_padding = 0
  },
  horizontal_flow_style =
  {
    type = "horizontal_flow_style",
    horizontal_spacing = 0
  },
}

local snouz_barebone_frame =
{
  type = "frame_style",
  padding = 0,
  margin = 0,
  use_header_filler = false,
  header_flow_style =
  {
    type = "horizontal_flow_style",
    bottom_padding = 0
  },
  horizontal_flow_style =
  {
    type = "horizontal_flow_style",
    horizontal_spacing = 0
  },
}

local snouz_large_barebone_frame =
{
  type = "frame_style",
  parent = "snouz_barebone_frame",
  padding = 3,
}

data.raw["gui-style"].default["snouz_invisible_frame"] = snouz_invisible_frame
data.raw["gui-style"].default["snouz_barebone_frame"] = snouz_barebone_frame
data.raw["gui-style"].default["snouz_large_barebone_frame"] = snouz_large_barebone_frame