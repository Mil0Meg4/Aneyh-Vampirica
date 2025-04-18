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
                          "a {C:dark_edition}unique{} {C:attention}Joker{} based off",
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
                text = {"{X:mult,C:white}^#1#{} Mult",
                        "At end of {C:money}shop{},",
                        "{C:red}removes{} {C:dark_edition}Divine{} from",
                        "Joker to the left",
                        "to gain {X:mult,C:white}^#2#{} Mult"
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
                text = { "{X:mult,C:white}X3{} Mult if played",
                         "hand contains only",
                         "{C:clubs}Clubs{} and {C:diamonds}Diamonds{}"
                }
            },
            j_anva_frisk = {
                name = 'Frisk',
                text = { "{C:chips}+20{} Chips for",
                         "each {C:attention}unique rarity",
                         "among your {C:attention}Jokers"
                }
            },
            j_anva_papyrus = {
                name = 'Papyrus',
                text = {"If played hand has",
                        "only {C:attention}1{} card, {C:attention}paint{} ",
                        "played cards {C:chips}Blue{}",
                        "before scoring"
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
                text = {"Scored {C:hearts}Hearts{} give {C:mult}+#1#{} Mult",
                        "Every other {C:hearts}Hearts{} card scored",
                        "consecutively, starting at the {C:attention}3rd{},",
                        "{C:attention}Doubles{} this gain until end of {C:attention}blind",
                        "{C:inactive}(eg. +4, +4, +8, +8, +16){}"
                }
            },
            j_anva_jandc = {
                name = 'Johnathon & Charlotte',
                text = {"{C:attention}+#2#{} Consumable Slots",
                        "{C:chips}-#1#{} Chips for every",
                        "held non-{C:dark_edition}negative{}",
                        "consumable over {C:attention}4"
                }
            },
            j_anva_pride_rainbow = {
                name = 'Pride Flag',
                text = { ""
                }
            },
            j_anva_filth = {
                name = 'Filth',
                text = { "{C:mult}+#2#{} Mult and {C:chips}+#1#{} Chips"
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
                text = { "{C:attention}+6{} Joker Slots, Consumable Slots,",
                    "Handsize, and Shop Slots",
                    "Scored {C:attention}6s{} give {C:chips}+66{}",
                    "Chips and {C:mult}+6{} Mult",
                    "After {C:attention}66{} {C:attention}6s{} are scored,",
                    "get {C:attention}6 Negative Tags{}",
                    "{C:inactive}(Currently {C:attention}#1#{C:inactive}/66){}"
                }
            },
            j_anva_triangleJoke = {
                name = 'Triangle Joker',
                text = { ""
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
                text = { "{C:attention}#1#{} Selected Joker",
                    "is made {C:attention}Rubber"
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
                text = { "When {C:red}destroyed{},",
                    "creates a {C:attention}copy",
                    "of itself"
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
            anva_paint_pink = {
                name = 'Pink Paint',
                text = { "{C:chips}+#1#{} Chips per {C:anv_pink}Pink",
                    "card in {C:attention}full deck",
                    "{C:chips}+#2#{} Chips per {C:anv_pink}Pink{} Joker",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips)"
                }
            },
            anva_paint_cyan = {
                name = 'Cyan Paint',
                text = { "{C:chips}+#1#{} Hands"
                }
            },
            anva_paint_purple = {
                name = 'Purple Paint',
                text = { "{C:red}+#1#{} Mult per time",
                    "an {C:attention}High Card{} or",
                    "{C:attention}Straight Flush{} has",
                    "been played this run",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)"
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
            k_tree_grow = "Grow!",
            k_tree3_grow = "Grow(3)!",
            k_discards = "+1 Discrds",
            k_hands = "+1 Hands",
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
            anva_paint_pink = "Pink Paint",
            anva_paint_cyan = "Cyan Paint",
            anva_paint_purple = "Purple Paint",
            anva_paint_brown = "Brown Paint",
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
