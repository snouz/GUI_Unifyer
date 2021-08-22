local mod_gui = require("mod-gui")

local function set_button_sprite(button, spritepath)
	if spritepath == nil then
		spritepath = ""
	end

	if button.type == "button" then
		-- normal button, we need to add a sprite as child
		if spritepath == "" then
			if button["button_sprite"] then
				button["button_sprite"].destroy()
			end
		else
			if button["button_sprite"] == nil then
				local sprite = button.add({type="sprite", name="button_sprite", sprite=spritepath, ignored_by_interaction=true })
				sprite.style.stretch_image_to_widget_size = true
				sprite.style.size = {32,32}
			else
				button["button_sprite"].sprite = spritepath
			end
		end
	end

	if button.type == "sprite-button" then
		-- sprite button, no special handling
		button.sprite = spritepath
		button.hovered_sprite = spritepath
		button.clicked_sprite = spritepath
	end
end



local function change_one_icon(player, sprite, button)
	local button_flow = mod_gui.get_button_flow(player)
	local modbutton = button_flow[button]
	if modbutton then
		modbutton.style = "slot_button_notext"
		set_button_sprite(modbutton, sprite)
	end
end

local function fix_buttons(player)
	local button_flow = mod_gui.get_button_flow(player)
	local iconlist = {
		{"helmod_button", "helmod_planner-command"},
		{"factoryplanner_button", "fp_button_toggle_interface"},
		{"moduleinserter_button", "module_inserter_config_button"},
		{"placeables_button", "buttonPlaceablesVisible"},
		{"todolist_button", "todo_maximize_button"},
		{"creativemod_button", "creative-mod_main-menu-open-button"},
		{"beastfinder_button", "beastfinder-menu-button"},
		{"bobclasses_button", "bob_avatar_toggle_gui"},
		{"bobinserters_button", "bob_logistics_inserter_button"},
		{"cleanmap_button", "CleanMap"},
		{"cleanmap_button", "DeleteEmptyChunks"},
		{"deathcounter_button", "DeathCounterMainButton"},
		{"ingteb_button", "ingteb"},
		{"outpostplanner_button", "OutpostBuilder"},
		{"rocketsilostats_button", "rocket-silo-stats-toggle"},
		{"schallsatellitecontroller_button", "Schall-SC-mod-button"},
		--{"", ""},
	}

	for _, k in pairs(iconlist) do
		change_one_icon(player, k[1], k[2])
	end

	--------------------------------
	--------- UNIQUE ONES ----------
	--------------------------------

	-- what-is-it-really-used-for
	local wiiuf_button = button_flow.wiiuf_flow and button_flow.wiiuf_flow.search_flow and button_flow.wiiuf_flow.search_flow["looking-glass"]
	if wiiuf_button then
		wiiuf_button.style = "slot_button_notext"
		set_button_sprite(wiiuf_button, "wiiuf_button")
	end

	-- quickbarimportexport
	if button_flow["qbie_flow_choose_action"] then
		local quickbarimportexport_button = button_flow["qbie_flow_choose_action"]["qbie_button_show_options"]
		local quickbarimport_button = button_flow["qbie_flow_choose_action"]["qbie_button_import"]
		local quickbarexport_button = button_flow["qbie_flow_choose_action"]["qbie_button_export"]
		if quickbarimportexport_button then
			quickbarimportexport_button.style = "slot_button_notext"
			set_button_sprite(quickbarimportexport_button, "quickbarimportexport_button")
		end
		if quickbarimport_button then
			quickbarimport_button.style = "slot_button_notext"
			set_button_sprite(quickbarimport_button, "quickbarimport_button")
		end
		if quickbarexport_button then
			quickbarexport_button.style = "slot_button_notext"
			set_button_sprite(quickbarexport_button, "quickbarexport_button")
		end
	end


end

function handle_cursor_changed_bp(event)
	-- blueprint-request
	local player = game.players[event.player_index]
    if not player or not player.valid then return end
    if player.is_cursor_blueprint() then
    	local button_flow = mod_gui.get_button_flow(player)
    	local blueprintrequest_button = button_flow["blueprint-request-button"]
		if blueprintrequest_button then
			blueprintrequest_button.style = "slot_button_notext"
			set_button_sprite(blueprintrequest_button, "blueprintrequest_button")
		end
    end
end

local function on_init()
	for idx, player in pairs(game.players) do
		fix_buttons(player)
	end
end

local function on_configuration_changed()
	for idx, player in pairs(game.players) do
		fix_buttons(player)
	end
end

local function on_player_created(event)
	fix_buttons(game.players[event.player_index])
end

script.on_init(on_init)
script.on_configuration_changed(on_configuration_changed)
script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_gui_click, on_configuration_changed)
script.on_event(defines.events.on_player_cursor_stack_changed, handle_cursor_changed_bp)