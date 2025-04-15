return {
    descriptions = {
        Back={},
        Blind={},
        Edition={},
        Joker={
            j_anva_sigma = {
                name = 'SIGMA',
                text = { "the next {C:purple}Tarot{} card used",
                         "{C:attention}transforms{} this Joker into",
                          "a {C:attention}unique{} Joker based off",
                          "the used card"
                }
            },
            j_anva_charon = {
                name = 'Charon',
                text = { "Quintuples money",
                        "at the end of Shop",
                         "{C:inactive}(Max of {C:money}$#1#{C:inactive}){}"
                }
            },
            j_anva_gaba = {
                name = 'Gabriel, Apostate of Hate',
                text = { "{X:mult,C:white}^#1#{} Mult",
                         "At end of shop, removes {C:planet}Divine{} from",
                         "Joker to the left to gain {X:mult,C:white}+^#2#{} Mult"
                }
            },  
            j_anva_sinclair = {
                name = 'Sinclair',
                text = {"Earns {C:money}$#1#{} at end of round.",
                        "When Shop is entered, if you have {C:money}$#2#{}",
                        "or more {C:red}debuffs{} all other {C:attention}Jokers{} until",
                        "you have {C:money}$0{} or less when exiting."
                },
            },
            j_anva_pugnala = {
                name = 'Pugnala',
                text = { "{X:mult,C:white}X3{} Mult if played hand contains",
                         "only {C:clubs}Clubs{} and {C:diamonds}Diamonds{}"
                }
            },
            j_anva_frisk = {
                name = 'Frisk',
                text = { "{C:chips}+20{} Chips for each",
                         "{C:attention}unique rarity{} among your Jokers"
                }
            },
            j_anva_papyrus = {
                name = 'Papyrus',
                text = { "If played hand contains",
                         "{C:attention}exactly{} 1 card, paint played",
                         "cards {C:blue}Blue{} before scoring"
                }
            },
            j_anva_sans = {
                name = 'Sans',
                text = { ""
                }
            },
            j_anva_doom = {
                name = 'Doom Itself',
                text = { ""
                }
            },
            j_anva_bartender = {
                name = 'Bartender',
                text = { ""
                }
            },
            j_anva_andromeda = {
                name = 'Andromeda',
                text = { ""
                }
            },
            j_anva_tree = {
                name = 'Tree',
                text = { "{C:mult}+#1#{} Mult",
                         "{C:mult}+#2#{} Mult at end of round"
                }
            },
            j_anva_tree3 = {
                name = 'Tree(3)',
                text = { "{X:mult,C:white}^^^#1#{} Mult",
                         "{X:mult,C:white}^^^#2#{} Mult at end of round"
                }
            },
            j_anva_poe = {
                name = 'Poe',
                text = { "Scored Hearts give {C:mult}+#1#{} Mult",
                         "Every other Hearts card scored consecutively, starting at the 3rd,",
                         "Doubles this gain until end of blind",
                         "{C:inactive}(eg. +4, +4, +8, +8, +16){}"
                }
            },
            j_anva_jandc = {
                name = 'Johnathon & Charlotte',
                text = { "{C:attention}+#2#{} Consumable Slots",
                         "{C:chips}-#1#{} Chips for every held non-negative consumable after the 4th"
                }
            },
            j_anva_pride_rainbow = {
                name = 'Pride Flag',
                text = { ""
                }
            },
            j_anva_filth = {
                name = 'Filth',
                text = { "{C:mult}+2{} Mult and {C:chips}+10{} Chips"
                }
            },
            j_anva_alphys = {
                name = 'Alphys, Royal Scientist',
                text = { "Create a {C:attention}Blueprint",
                    "after defeating {C:attention}Boss Blind"
                }
            },
            j_anva_gaster = {
                name = 'Gaster, Royal Scientist',
                text = { "{C:attention}+6{} Joker Slots, Consumable Slots, Handsize, and Shop Slots",
                    "Scored {C:attention}6s{} give {C:chips}+66{} Chips and {C:mult}+6{} Mult",
                    "After {C:attention}66{} {C:inactive}[#1#]{} {C:attention}6s{} are scored, get {C:attention}6 Negative Tags{}"
                }
            },
            
        },
        Augment={
            c_anva_aug_mother = {
                name = 'Motherboard',
                text = { ""
                }
            },
            c_anva_aug_lever = {
                name = 'Lever',
                text = { ""
                }
            },
            c_anva_aug_rubber = {
                name = 'Rubber',
                text = { "1 Selected Joker is made Rubber"
                }
            },
        },
        Enhanced = {
            m_anva_omega = {
                name = "Omega Card",
                text = {"{X:chips,C:white}^#1#{} Chips"}
            },
            m_anva_alpha = {
                name = "Alpha Card",
                text = {"{X:mult,C:white}^#1#{} Mult"}
            },
        },
        Other={
            anva_lever = {
                name = 'Lever',
                text = { ""
                }
            },
            anva_rubber = {
                name = 'Rubber',
                text = { "When destroyed, creates a copy of self"
                }
            },
            anva_paint_red = {
                name = 'Red Paint',
                text = { "{C:red}+#1#{} Mult"
                }
            },
            anva_paint_blue = {
                name = 'Blue Paint',
                text = { "{C:chips}+#1#{} Chips"
                }
            },
            anva_paint_green = {
                name = 'Green Paint',
                text = { "{C:red}+#1#{} Discards"
                }
            },
            anva_paint_yellow = {
                name = 'Yellow Paint',
                text = { "Earn {C:money}$#1#{}"
                }
            },
            anva_paint_orange = {
                name = 'Orange Paint',
                text = { "Retriggers {C:attention}#1#{} time"
                }
            },
            
        },
        Planet={},
        Spectral={},
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_anva_prim = "Primordial",
            k_anva_unb = "Unbound",
            k_augment = "Augment Card",
            b_augment_cards = "Augment Cards",
            anva_tweak_ui = "Tweaks",
            anva_paint_ui = "Paints"
        },
        high_scores={},
        labels={
            anva_prim = "Primordial",
            anva_unb = "Unbound",
            anva_paint_red = "Red Paint",
            anva_paint_blue = "Blue Paint",
            anva_paint_green = "Green Paint",
            anva_paint_yellow = "Yellow Paint",
            anva_paint_orange = "Orange Paint",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}
