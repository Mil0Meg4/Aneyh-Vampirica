SMODS.Rarity({
	key = "prim",
	badge_colour = ANVA.C.PRIMORDIAL,
	pools = {
		["Joker"] = {
			rate = 0.01, --added which pool its in so it can naturally spawn. mess arround with it
		},
	},
	default_weight = 0.01,
})

SMODS.Rarity({
	key = "unb",
	badge_colour = ANVA.C.UNBOUND,
	pools = {},
})

function ANVA.unbound(card)
	print("fuck")
	G.E_MANAGER:add_event(Event({
		func = function()
			if card.unbound and card.unbound.evo then
				play_sound('tarot2', 1.1, 0.6)
				card:set_ability(G.P_CENTERS["j_anva_"..card.unbound.evo])
			else print("No Unbound Field") end
			return true
		end
	}))
	return {
		message = localize('k_anva_unb'),
		colour = ANVA.C.UNBOUND,
		card = card
	}
end
function ANVA.literally_me_fr(card,joker_key)
    G.E_MANAGER:add_event(Event({
        func = function()
            play_sound('tarot2', 1.1, 0.6)
            card:set_ability(G.P_CENTERS["j_anva_"..joker_key])
            return true
        end
    }))
    return {
        message = localize('k_anva_prim'),
        colour = ANVA.C.PRIMORDIAL,
        card = card
    }
end

SMODS.Joker({
	key = "sigma",
	atlas = "joke", --the atlas obv
	rarity = "anva_prim",
	cost = 10,
	unlocked = true,
	discovered = false,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = false, --If this is true, blueprint will say "Compatible"
	pos = {
		x = 0,
		y = 2, --the position in the atlas. x + 1 would be 71 pixels to the right (cause the atlas is set to 71px) and y + 1 would be 95 pixels down (cause the atlas is set to 95px)
	},
	config = {
		extra = {},
	},
	calculate = function(self, card, context)
		if not context.blueprint then
			if context.using_consumeable and context.consumeable.config.center.key == "c_hanged_man" then --checks if the used card is hanged man
				print("1")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_high_priestess" then
				print("2")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_emperor" then
				print("3")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_emperess" then
				print("4")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_devil" then
				print("5")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_moon" then
				print("5")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_world" then
				print("6")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_star" then
				return ANVA.literally_me_fr(card,"andromeda")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_sun" then
				print("8")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_lovers" then
				print("9")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_tower" then
				print("10")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_death" then
				print("11")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_judgement" then
				print("12")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_hermit" then
				return ANVA.literally_me_fr(card,"charon")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_temperance" then
				print("14")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_strength" then
				print("15")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_wheel_of_fortune" then
				print("16")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_justice" then
				print("17")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_heirophant" then
				print("18")
			elseif context.using_consumeable and context.consumeable.config.center.key == "c_magician" then
				print("19")
			elseif context.using_consumeable and context.consumeable.ability.set == "Tarot" then --this will activate if the all the above returns false
				print("Tarot Used")
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return true --if this was false this joker wouldnt spawn naturally.
	end,
	set_badges = function(self, card, badges)
		badges[#badges - 1] = create_badge("Primer", G.C.ORANGE, G.C.WHITE, 1) --This adds the primer badge ABOVE the rarity. if this was +1 it would add below
	end,
})

SMODS.Joker({
	key = "charon",
	atlas = "joke",
	rarity = "anva_prim",
	cost = 50,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	pos = {
		x = 0,
		y = 0,
	},
	config = {
		extra = {
			max = 2000, --maximum value as variable
		},
	},
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.max },
		}
	end,
	calculate = function(self, card, context)
		local anv = card.ability.extra
		if context.ending_shop and not context.blueprint then
			--ease_dollars(to_number(math.max(0, math.min(G.GAME.dollars * 5, anv.max)), true))---ease_dollars is used to manipulate the ammount of cash you have, to_number is for talisman compatiblity and math.max is used to set the max value for the added cash
			return {
				dollars = to_number(math.max(0, math.min(G.GAME.dollars * 4, anv.max)))
			}
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return true
	end,
})

SMODS.Joker({
	key = "andromeda",
	atlas = "joke",
	rarity = "anva_prim",
	cost = 50,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 0,
		y = 0,
	},
	calculate = function(self, card, context)
		if context.individual and context.other_card:is_suit("Diamonds") and context.cardarea == G.play then
			if #G.consumeables.cards < G.consumeables.config.card_limit or self.area == G.consumeables then
				local new_card = SMODS.add_card({
					key = "c_star",
					area = G.consumeables,
				})
				new_card.ability.extra_value = (new_card.sell_cost * 25) - new_card.sell_cost
				new_card:set_cost()
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return true
	end,
})

SMODS.Joker({
	key = "sinclair",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = 3,
	cost = 10,
	config = {
		extra = {
			money = 10,
			max = 100,
			active = false,
		},
	},
	unlocked = true,
	discovered = false,
	eternal_compat = false,
	blueprint_compat = false,
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return { vars = { anv.money, anv.max } }
	end,
	calculate = function(self, card, context)
		local anv = card.ability.extra
		local c = context --i got lazy. This is the same thing as anv, just used for "context"
		if c.end_of_round and context.main_eval and not context.blueprint then
			ease_dollars(anv.money) --add money
		end
		if c.starting_shop and to_number(G.GAME.dollars) > anv.max then --checks entering the shop and compares the ammount of dollars player has with anv.max, in this case 100. to_number() is for talisman compatiblity.
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].debuff == false then --checks for any card which is NOT THIS CARD and if the cards are debuffed.
					SMODS.debuff_card(G.jokers.cards[i], true, card.config.center.key) --debuffs the cards
					anv.active = true --sets active to true. I added this to avoid the cards being undebuffed for no reason when the shop is left with 0 cash or less.
				end
			end
		end
		if c.ending_shop and to_number(G.GAME.dollars) <= 0 and anv.active then --checks if the player has left the shop, compares the ammount of dollars player has to 0, and checks if active is true
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].debuff == true then --same thing as the one above, but this time checks for debuffed cards
					SMODS.debuff_card(G.jokers.cards[i], false, card.config.center.key) --removes the debuff from debuffed cards
					anv.active = false --sets the check as false since it reverted
				end
			end
		end
	end,
})

SMODS.Joker({
	key = "tree",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = 1,
	cost = 4,
	config = { extra = { mult = 3, mult_mod = 2 } },
	unlocked = true,
	discovered = false,
	perishable_compat = false,
	blueprint_compat = true,
	unbound = {evo = "tree3",tarots = 0,cards=0,discards=0},
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.mult, anv.mult_mod },
		}
	end,
	calculate = function(self, card, context)
		local anv = card.ability.extra
		if context.joker_main then
			return {
				mult = anv.mult,
			}
		end
		if (context.end_of_round and context.cardarea == G.jokers) and not context.blueprint then
			anv.mult = anv.mult + anv.mult_mod
		end
		--------unbound--------
		if context.after and not context.blueprint then
			card.unbound.cards = card.unbound.cards + #G.play.cards
		end
		if context.discard and not context.blueprint then
			card.unbound.discards = card.unbound.discards + 1
		end
		if context.using_consumeable and context.consumeable.ability.set == "Tarot" and not context.blueprint then
			card.unbound.tarots = card.unbound.tarots + 1
		end
		if context.after or context.discard or context.using_consumeable and not context.blueprint then
			if card.unbound.tarots >= 33 and card.unbound.discards >= 333 and card.unbound.cards >= 333 then
				return ANVA.unbound(card)
			end
		end
	end,
})

SMODS.Joker({
	key = "tree3",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = "anva_unb",
	cost = 400,
	config = { extra = { eeemult = 3, eeemult_mod = 2 } },
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.eeemult, anv.eeemult_mod },
		}
	end,
	calculate = function(self, card, context)
		local anv = card.ability.extra
		if context.joker_main then
			return {
				eeemult = anv.eeemult,
			}
		end
		if (context.end_of_round and context.cardarea == G.jokers) and not context.blueprint then
			anv.eeemult = anv.eeemult + anv.eeemult_mod
		end
	end,
})

SMODS.Joker({
	key = "bartender",
	atlas = "joke",
	pos = { x = 0, y = 0 },
	rarity = 2,
	cost = 6,
	config = { extra = { mult = 5, con_slot = 1 } },
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.mult, anv.con_slot },
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local anv = card.ability.extra
			local drinks = 0
			for i = 1, #G.consumeables.cards do
				drinks = drinks + 1
			end
			return {
				mult = anv.mult * drinks,
			}
		end
	end,

	add_to_deck = function(self, card, from_debuff)
		local anv = card.ability.extra
		G.consumeables.config.card_limit = G.consumeables.config.card_limit + anv.con_slot
	end,

	remove_from_deck = function(self, card, from_debuff)
		local anv = card.ability.extra
		G.consumeables.config.card_limit = G.consumeables.config.card_limit - anv.con_slot
	end,
})

function nonstone()
	local bb = #G.playing_cards
	if G.playing_cards then
		for _, v in pairs(G.playing_cards) do
			if SMODS.has_enhancement(v, "m_stone") then
				bb = bb - 1
			end
		end
		return bb
	end
	return #G.playing_cards
end

SMODS.Joker({
	key = "doom",
	atlas = "joke",
	rarity = "anva_prim",
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 0,
		y = 0,
	},
	config = {
		extra = {
			chips = 125000,
			chips2 = 2500000
		},
	},
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.max },
		}
	end,
	calculate = function(self, card, context)
		local anv = card.ability.extra
		if context.joker_main then
			if nonstone() > 0 then
				return{
					chips = anv.chips,
				}
			else
				return{
					chips = anv.chips2,
				}
			end
		end
		if context.individual and context.cardarea == G.play then
			if context.other_card.ability.effect == "Stone Card" then
				local cards = {}
				for i = 1, #G.playing_cards do
					if G.playing_cards[i].ability.effect ~= "Stone Card" then
						cards[#cards + 1] = G.playing_cards[i]
					end
				end
				print(#cards)
				G.E_MANAGER:add_event(Event({
					func = function()
						if #cards > 0 then
						local card2 = pseudorandom_element(cards, pseudoseed("doom"))
						card2:start_dissolve({ HEX("57ecab") }, nil, 0.1) 
						card2 = nil
						end
						return true
					end,
				}))
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return false
	end,
})
SMODS.Joker({
	key = "pride_rainbow",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	pos = {
		x = 1,
		y = 0,
	},
	pride_flag_paints = {any=true}
})


--[[ SMODS.Joker({
	key = "pride_test",
	atlas = "wip",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 2,
		y = 0,
	},
	pride_flag_paints = {red=true,blue=true,green=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = { key = "anva_paint_"..k, set = "Other", vars = {} }
		end
	end,
}) ]]
