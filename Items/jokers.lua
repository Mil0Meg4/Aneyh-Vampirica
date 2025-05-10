SMODS.Rarity({
	key = "prim",
	badge_colour = ANVA.C.PRIMORDIAL,
	pools = {
		["Joker"] = {
			rate = G.GAME and 0.002 * math.floor((G.GAME.round_resets.ante - 1)/4) or 0.002, --formula for how rare primordials are. They can't apperar before ante 5 and the chances increase every 4 antes
		},
	},
	default_weight = 0.002,
})

SMODS.Rarity({
	key = "unb",
	badge_colour = ANVA.C.UNBOUND,
	pools = {},
})

function ANVA.unbound(card)
	G.E_MANAGER:add_event(Event({
		func = function()
			if card.ability.unbound and card.ability.unbound.evo then
				play_sound('tarot2', 1.1, 0.6)
				card:set_ability(G.P_CENTERS["j_anva_"..card.ability.unbound.evo])
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
		--[[ if c.end_of_round and context.main_eval and not context.blueprint then
			ease_dollars(anv.money) --add money
		end ]]
		if c.starting_shop and to_number(G.GAME.dollars) > anv.max then --checks entering the shop and compares the ammount of dollars player has with anv.max, in this case 100. to_number() is for talisman compatiblity.
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].debuff == false then --checks for any card which is NOT THIS CARD and if the cards are debuffed.
					SMODS.debuff_card(G.jokers.cards[i], true, card.config.center.key) --debuffs the cards
					anv.active = true --sets active to true. I added this to avoid the cards being undebuffed for no reason when the shop is left with 0 cash or less.
				end
			end
			return {
				message = localize('k_debuffed'),
				colour = G.C.RED,
				card = card
			}
		end
		if c.ending_shop and to_number(G.GAME.dollars) <= 0 and anv.active then --checks if the player has left the shop, compares the ammount of dollars player has to 0, and checks if active is true
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].debuff == true then --same thing as the one above, but this time checks for debuffed cards
					SMODS.debuff_card(G.jokers.cards[i], false, card.config.center.key) --removes the debuff from debuffed cards
					anv.active = false --sets the check as false since it reverted
				end
			end
			return {
				message = localize('k_dedebuffed'),
				colour = G.C.GREEN,
				card = card
			}
		end
	end,
	calc_dollar_bonus = function(self, card)
		return card.ability.extra.money
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
			return {
				message = localize('k_tree_grow'),
				colour = G.C.RED,
				card = card
			}
		end
		--------unbound--------
		if context.after and not context.blueprint then
			card.ability.unbound.cards = card.ability.unbound.cards + #G.play.cards
		end
		if context.discard and not context.blueprint then
			card.ability.unbound.discards = card.ability.unbound.discards + 1
		end
		if context.using_consumeable and not context.blueprint then
			card.ability.unbound.tarots = card.ability.unbound.tarots + 1
		end
		if context.after or context.discard or context.using_consumeable and not context.blueprint then
			if card.ability.unbound.tarots >= 33 and card.ability.unbound.discards >= 333 and card.ability.unbound.cards >= 333 then
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
			return {
				message = localize('k_tree3_grow'),
				colour = G.C.RED,
				card = card
			}
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
		local drinks = G.consumeables and #G.consumeables.cards or 0
		return {
			vars = { anv.mult, anv.con_slot, anv.mult * drinks},
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local anv = card.ability.extra
			local drinks = #G.consumeables.cards
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

function ANVA.nonstone()
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
	pride_flag_paints = {any=true},
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_pan",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 4,
	},
	pride_flag_paints = {pink=true,yellow=true,cyan=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_bi",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 3,
	},
	pride_flag_paints = {red=true,purple=true,blue=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_trans",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 5,
	},
	pride_flag_paints = {blue=true,pink=true,white=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_lesbian",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 9,
	},
	pride_flag_paints = {orange=true,white=true,purple=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_gay",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 1,
	},
	pride_flag_paints = {cyan=true,white=true,blue=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_nb",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 2,
	},
	pride_flag_paints = {yellow=true,purple=true,black=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_ace",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 6,
	},
	pride_flag_paints = {black=true,white=true,purple=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_aro",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 7,
	},
	pride_flag_paints = {green=true,white=true,black=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "pride_aroace",
	atlas = "joke",
	rarity = 3,
	cost = 10,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	pos = {
		x = 1,
		y = 8,
	},
	pride_flag_paints = {yellow=true,white=true,blue=true},
	loc_vars = function(self, info_queue, card)
		for k,v in pairs(self.pride_flag_paints) do
			info_queue[#info_queue + 1] = ANVA.paint_tooltip(k)
		end
	end,
	in_pool = function(self, wawa, wawa2)
		return G.GAME.current_pride_flag == self.key
    end,
})

SMODS.Joker({
	key = "triangleJoke",
	atlas = "joke",
	pos = { x = 4, y = 1 },
	rarity = 3,
	cost = 7,
	config = {
		extra = {
			xmult = 3
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.xmult },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and #G.play.cards == 3 then
			if context.other_card:get_id() == 3 then
				local anv = card.ability.extra
				return{
					xmult = anv.xmult,
				}
			end
		end
	end,
})

SMODS.Joker({
	key = "godot",
	atlas = "joke",
	pos = { x = 4, y = 0 },
	rarity = 2,
	cost = 7,
	config = {extra = { x_mult = 3,}},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.x_mult},
		}
	end,
	calculate = function(self, card, context)
		if context.other_joker and ANVA.has_tweak(context.other_joker) then
			local anv = card.ability.extra
			return {
				xmult = anv.x_mult,
				card = card
			}
		end
	end,
})

SMODS.Joker({
	key = "tall_joker",
	atlas = "joke",
	pos = { x = 4, y = 5 },
	rarity = 1,
	cost = 4,
	display_size = { w = 71.0 / 1.3, h = 95 * 1.1 },
	config = {
		extra = {
			chips = 50
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		local anv = card.ability.extra
		return {
			vars = { anv.chips },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_bonus") then
				local anv = card.ability.extra
				return{
					chips = anv.chips,
				}
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		for k, v in pairs(G.playing_cards) do
			if SMODS.has_enhancement(v, "m_bonus") then return true end --if this was false this joker wouldnt spawn naturally.	
		end
		return false
	end,
})

SMODS.Joker({
	key = "short_joker",
	atlas = "joke",
	pos = { x = 4, y = 6 },
	rarity = 1,
	cost = 4,
	display_size = { w = 71.0 * 1.1, h = 95 / 1.01 },
	config = {
		extra = {
			mult = 10
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
		local anv = card.ability.extra
		return {
			vars = { anv.mult },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_bonus") then
				local anv = card.ability.extra
				return{
					mult = anv.mult,
				}
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		for k, v in pairs(G.playing_cards) do
			if SMODS.has_enhancement(v, "m_bonus") then return true end --if this was false this joker wouldnt spawn naturally.	
		end
		return false
	end,
})

SMODS.Joker({
	key = "swordfish",
	atlas = "joke",
	pos = { x = 4, y = 8 },
	rarity = 2,
	cost = 5,
	config = {
		extra = {
			xmult = 5
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
		local anv = card.ability.extra
		return {
			vars = { anv.xmult },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_mult") then
				if context.other_card:is_suit("Spades") then
					if context.other_card:get_id() == 14 then
						local anv = card.ability.extra
						return{
							xmult = anv.xmult,
						}
					end
				end
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		for k, v in pairs(G.playing_cards) do
			if SMODS.has_enhancement(v, "m_mult") then return true end --if this was false this joker wouldnt spawn naturally.	
		end
		return false
	end,
})

SMODS.Joker({
	key = "memory",
	atlas = "joke",
	pos = { x = 4, y = 7 },
	rarity = 1,
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	update = function(self, card, front)
		if G.STAGE == G.STAGES.RUN then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					other_joker = G.jokers.cards[i + 1]
				end
			end
			if other_joker and other_joker ~= card and other_joker.config.center.rarity == 1 and other_joker.config.center.blueprint_compat then
				card.ability.blueprint_compat = "compatible"
			else
				card.ability.blueprint_compat = "incompatible"
			end
		end
	end,
	loc_vars = function(self, info_queue, card)
		card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ""
		card.ability.blueprint_compat_check = nil
		return {
			main_end = (card.area and card.area == G.jokers) and {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = {
								ref_table = card,
								align = "m",
								colour = G.C.JOKER_GREY,
								r = 0.05,
								padding = 0.06,
								func = "blueprint_compat",
							},
							nodes = {
								{
									n = G.UIT.T,
									config = {
										ref_table = card.ability,
										ref_value = "blueprint_compat_ui",
										colour = G.C.UI.TEXT_LIGHT,
										scale = 0.32 * 0.8,
									},
								},
							},
						},
					},
				},
			} or nil,
		}
	end,
	calculate = function(self, card, context)
		local other_joker = nil
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i] == card then
				other_joker = G.jokers.cards[i + 1]
			end
		end
		if other_joker and other_joker ~= card and other_joker.config.center.rarity == 1 then
			context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
			context.blueprint_card = context.blueprint_card or card

			if context.blueprint > #G.jokers.cards + 1 then
				return
			end

			local other_joker_ret, trig = other_joker:calculate_joker(context)
			local eff_card = context.blueprint_card or card

			context.blueprint = nil
			context.blueprint_card = nil

			if other_joker_ret == true then
				return other_joker_ret
			end
			if other_joker_ret or trig then
				if not other_joker_ret then
					other_joker_ret = {}
				end
				other_joker_ret.card = eff_card
				other_joker_ret.colour = G.C.FILTER
				other_joker_ret.no_callback = true
				return other_joker_ret
			end
		end
	end,
})

SMODS.Joker({
	key = "catJoker",
	atlas = "joke",
	pos = { x = 4, y = 9 },
	rarity = 3,
	cost = 7,
	config = {
		extra = {
			retrigger_amount = 1
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		local anv = card.ability.extra
		return {
			vars = { anv.retrigger_amount },
		}
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
			if context.other_card:get_id() == 3 then
				local anv = card.ability.extra
				local current_retrigger_count = 0
				for i, _card in pairs(G.hand.cards) do
					if _card:get_id() == 3 then
						current_retrigger_count = current_retrigger_count + anv.retrigger_amount
					end
				end
				return{
					repetitions = current_retrigger_count
				}
			end
		end
	end,
})

SMODS.Joker({
	key = "frankenjoker",
	atlas = "joke",
	pos = { x = 5, y = 0 },
	rarity = 1,
	cost = 4,
	display_size = { w = 71.0 * 1.021, h = 95 * 1.021 },
	config = {
		extra = {
			chipsgained = 10,
			multgained = 2
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
		local anv = card.ability.extra
		return {
			vars = { anv.chipsgained, anv.multgained },
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.has_enhancement(context.other_card, "m_wild") then
				local anv = card.ability.extra
				local poll = pseudorandom('frankenpoll')
				local color = nil
				if poll < 1/2 then
					context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
					context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + anv.chipsgained
					color = G.C.CHIPS
				else
					context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
					context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + anv.multgained
					color = G.C.MULT
				end
                return {
                    message = localize('k_upgrade_ex'),
					colour = color,
                    card = card
                }
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		for k, v in pairs(G.playing_cards) do
			if SMODS.has_enhancement(v, "m_wild") then return true end --if this was false this joker wouldnt spawn naturally.	
		end
		return false
	end,
})

SMODS.Joker({
	key = "punker",
	atlas = "joke",
	pos = { x = 5, y = 1 },
	rarity = 3,
	cost = 8,
	config = {
		extra = {
			multgained = 6,
			multgainedsteel = 12,
			currentmult = 0
		},
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
		info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
		local anv = card.ability.extra
		return {
			vars = { anv.multgained, anv.multgainedsteel, anv.currentmult },
		}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local anv = card.ability.extra
			return {
				mult = anv.currentmult,
			}
		end
		if context.individual and context.cardarea == G.play then
			local anv = card.ability.extra
			local currentincrease = anv.multgained
			if SMODS.has_enhancement(context.other_card, "m_mult") then
				for i, _card in pairs(G.hand.cards) do
					if SMODS.has_enhancement(_card, "m_steel") then
						currentincrease = anv.multgainedsteel
					end
				end
				anv.currentmult = anv.currentmult + currentincrease
				return {
                    message = localize('k_upgrade_ex'),
					colour = color,
                    card = card
                }
			end
		end
	end,
	in_pool = function(self, wawa, wawa2)
		for k, v in pairs(G.playing_cards) do
			if SMODS.has_enhancement(v, "m_mult") then return true end --if this was false this joker wouldnt spawn naturally.	
		end
		return false
	end,
})



