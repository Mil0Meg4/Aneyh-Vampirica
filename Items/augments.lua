SMODS.ConsumableType({
    key = "Augment",
    primary_colour = ANVA.C.AUGMENT,
    secondary_colour = ANVA.C.AUGMENT,
    collection_rows = {4, 3},
    shop_rate = 4,
    default = 'c_anva_motherboard'
})

SMODS.UndiscoveredSprite({
    key = "Augment",
    atlas = "wip",
    pos = { x = 0, y = 0 },
    no_overlay = true
})

SMODS.Consumable({
    key = 'aug_mother',
    set = 'Augment',
    atlas = 'wip',
    pos = {x=0, y=0},
    discovered = true,
    config = {max_highlighted = 1, left_val = 1,right_val = 0},
    can_use = function(self, card)--determins when you can use the consumable
        --checks that at least one joker is selected but not more than the maximum allowed
		return #G.jokers.highlighted > 0 and #G.jokers.highlighted <= self.config.max_highlighted
	end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()--short delay before the effect
            play_sound('tarot1')--normal consumable shenanigans
            card:juice_up(0.3, 0.5)--normal consumable shenanigans
            for _, v in ipairs(G.jokers.highlighted) do--apply to all selected jokers
                local pos_val = G.jokers.cards[1] == v and self.config.left_val or self.config.right_val--checks if selected joker is leftmost
                --set all values to 1 or 0, the second argument is nil since we re not using any reference table
                --the last one is nil too since we want to affect all values
                if  not v.config.center.immutable then --does not apply the effect on immutable jokers
                    ANVA.mod_table_values(v.ability,nil,{set = pos_val},nil,nil)
                end
            end
        return true end }))
    end
})

SMODS.Consumable({
    key = 'aug_rubber',
    set = 'Augment',
    atlas = 'wip',
    pos = {x=0, y=0},
    discovered = true,
    config = {max_highlighted = 1, tweak = "rubber"},
    can_use = function(self, card)--determins when you can use the consumable
        --checks that at least one joker is selected but not more than the maximum allowed
		return #G.jokers.highlighted > 0 and #G.jokers.highlighted <= self.config.max_highlighted
	end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()--short delay before the effect
            play_sound('tarot1')--normal consumable shenanigans
            card:juice_up(0.3, 0.5)--normal consumable shenanigans
            for _, v in ipairs(G.jokers.highlighted) do--apply to all selected jokers
                ANVA.set_tweak(v, card.ability.tweak)--set the tweak
            end
        return true end }))
    end
})

SMODS.Consumable({
    key = 'aug_lever',
    set = 'Augment',
    atlas = 'wip',
    pos = {x=0, y=0},
    discovered = true,
    config = {max_highlighted = 1, tweak = "lever"},
    can_use = function(self, card)--determins when you can use the consumable
        --checks that at least one joker is selected but not more than the maximum allowed
		return #G.jokers.highlighted > 0 and #G.jokers.highlighted <= self.config.max_highlighted
	end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.4,func = function()--short delay before the effect
            play_sound('tarot1')--normal consumable shenanigans
            card:juice_up(0.3, 0.5)--normal consumable shenanigans
            for _, v in ipairs(G.jokers.highlighted) do--apply to all selected jokers
                ANVA.set_tweak(v, card.ability.tweak)--set the tweak
            end
        return true end }))
    end
})