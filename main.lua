ANVA = {}
ANVA.C = {
    VAMPIRICA = HEX("880808"),
    AUGMENT = HEX("b59262"),
    DIVINE = HEX("ffffbb"),
    FAUST = HEX("b66444"),
    CURSED = HEX("4a0044"),
    PRIMORDIAL = HEX("000000"),
    UNBOUND = HEX("000000"),
    ARTIFACT = HEX("000000"),
    PINK = HEX("eda5b2"),
    CYAN = HEX("93cbcb"),
    BROWN = HEX("4e3f36"),
}
ANVA.GRADIENTS = {
    UNDER = {G.C.RED,G.C.PURPLE},
    ULTRA = {ANVA.C.VAMPIRICA,G.C.BLACK},
    VAMP = {ANVA.C.VAMPIRICA,G.C.MONEY},
    HOLLOW = {HEX("6b8cad"),G.C.BLACK},
    PRIMORDIAL = {ANVA.C.VAMPIRICA,HEX("52134b")},
    UNBOUND = {HEX("bc5a25"),ANVA.C.VAMPIRICA},
    ARTIFACT = {HEX("40b5c4"),HEX("a8ced3")}

}
SMODS.load_file("Items/funcs.lua")()
SMODS.load_file("Items/editions.lua")()
SMODS.load_file("Items/augments.lua")()
SMODS.load_file("Items/tweaks.lua")()
SMODS.load_file("Items/paints.lua")()
SMODS.load_file("Items/enhancements.lua")()
SMODS.load_file("Items/jokers.lua")()
SMODS.load_file("Items/planars/ultrakill.lua")()
SMODS.load_file("Items/planars/undertale.lua")()
SMODS.load_file("Items/planars/vampire.lua")()
SMODS.load_file("Items/planars/hollowknight.lua")()

--joker ATLAS
SMODS.Atlas{
    key = "joke",
    path = "joker.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
    key = "enha",
    path = "enhancement.png",
    px = 71,
    py = 95
}
--augment ATLAS
SMODS.Atlas{
    key = "aug",
    path = "augment.png",
    px = 71,
    py = 95
}

--Mod icon
SMODS.Atlas({
    key = "modicon",
    path = "modicon.png",
    px = 34,
    py = 34
})

local lc = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        lc()
    end
    G.ARGS.LOC_COLOURS.anv_pink = ANVA.C.PINK
    G.ARGS.LOC_COLOURS.anv_cyan = ANVA.C.CYAN
    G.ARGS.LOC_COLOURS.anv_under = ANVA.C.UNDER
    return lc(_c, _default)
end

local orig_update = Game.update
function Game:update(dt)
    orig_update(self,dt)
	local anim_timer = self.TIMERS.REAL * 1.5
	local p = 0.5 * (math.sin(anim_timer) + 1)
	for k, c in pairs(ANVA.GRADIENTS) do
		if not ANVA.C[k] then
			ANVA.C[k] = { 0, 0, 0, 0 }
		end
		for i = 1, 4 do
			ANVA.C[k][i] = c[1][i] * p + c[2][i] * (1 - p)
		end
	end
end
--new context that trigger whenever a card is destroyed or sold
local orig_start_dissolve = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
	--[[ if G and G.jokers and G.jokers.cards then
		SMODS.calculate_context({ anva_destroyed = true, card = self })
	end ]]
    if self.ability and self.ability.anva_rubber and not self.ability.selling then
        local copy = copy_card(self, nil, nil, nil, nil)
        copy:start_materialize()
        copy:add_to_deck()
        G.jokers:emplace(copy)
    end
	return orig_start_dissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
end

function SMODS.current_mod.reset_game_globals(run_start)
	if run_start then
        G.GAME.current_pride_flag = ANVA.poll_flag("game_start")
    end
end

SMODS.Sound({
	key = "prim_music",
	path = "primordial.ogg",
	sync = false,
	pitch = 1,
	select_music_track = function()
		return #ANVA.advanced_find_joker(nil,"anva_prim", nil, nil, true) ~= 0
	end
})
-------------------------------------------------------------------------
----stuff for making tweaks and paints have their own collection tabs----
-------------------------------------------------------------------------
SMODS.current_mod.custom_collection_tabs = function()
    return {
        UIBox_button({
        button = 'your_collection_anva_tweaks',
        id = 'your_collection_anva_tweaks',
        label = { localize('anva_tweak_ui') },
        minw = 5,
        minh = 1
        }),
        UIBox_button({
        button = 'your_collection_anva_paints',
        id = 'your_collection_anva_paints',
        label = { localize('anva_paint_ui') },
        minw = 5,
        minh = 1
        })
    }
end

local function wrap_without_paints_and_tweaks(func)
    local removed = {}
    for k, v in pairs(SMODS.Stickers) do
        if ANVA.is_paint(k) or ANVA.is_tweak(k) then
        removed[k] = v
        SMODS.Stickers[k] = nil
        end
    end

    local ret = func()

    for k, v in pairs(removed) do
        SMODS.Stickers[k] = v
    end

    return ret
end

local stickers_ui_ref = create_UIBox_your_collection_stickers
create_UIBox_your_collection_stickers = function()
    return wrap_without_paints_and_tweaks(stickers_ui_ref)
end

local other_objects_ref = create_UIBox_Other_GameObjects
create_UIBox_Other_GameObjects = function()
    return wrap_without_paints_and_tweaks(other_objects_ref)
end


------------------------------------------------------------
-----------------------Planar Sets--------------------------
------------------------------------------------------------
SMODS.ObjectType({
	key = "undertale",
	default = "j_anva_frisk",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "ultrakill",
	default = "j_anva_filth",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "planar",
	default = "j_anva_filth",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

SMODS.ObjectType({
	key = "vampire",
	default = "j_anva_poe",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})
SMODS.ObjectType({
	key = "hollow",
	default = "j_anva_sly",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})

--------------------------------------------------------
-------------------Alpha and Omega----------------------
--------------------------------------------------------
SMODS.Rank {

    key = 'alpha_rank',
    card_key = 'ALPHA',

    --hc_atlas = 'aug',
    --lc_atlas = 'aug',
    pos = { x = 1 },

    next = { 'anva_omega_rank' },
	prev = { 'anva_omega_rank' },

    nominal = 0,
    shorthand = 'a',
    hidden = true,

	in_pool = function(self, args)
        return false
    end
}
SMODS.Rank {

    key = 'omega_rank',
    card_key = 'OMEGA',

    --hc_atlas = 'aug',
    --lc_atlas = 'aug',
    pos = { x = 1 },

    next = { 'anva_alpha_rank' },
	prev = { 'anva_alpha_rank' },

    nominal = 0,
    shorthand = 'o',
    hidden = true,

	in_pool = function(self, args)
        return false
    end
}
SMODS.Suit {

    key = 'al_om',
    card_key = 'ALPHA_OMEGA',

    --lc_atlas = 'aug',
    --lc_ui_atlas = 'aug',
    lc_colour = ANVA.C.VAMPIRICA,

    --hc_atlas = 'aug',
    --hc_ui_atlas = 'aug',
    hc_colour = ANVA.C.VAMPIRICA,

    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },

    in_pool = function(self, args)
        return false
    end
}
