dofile("optimizer-lib.lua")

local base = 50

local pokemon_types = {"Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying",
                       "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Steel", "Dark", "Fairy"}

local types = {{1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1},
               {1, 1, 2, 1, 0.5, 0.5, 1, 1, 2, 1, 1, 0.5, 2, 1, 1, 0.5, 1, 0.5},
               {1, 0.5, 1, 2, 2, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.5, 1, 1},
               {1, 1, 1, 1, 1, 1, 1, 1, 2, 0.5, 1, 1, 1, 1, 1, 0.5, 1, 1},
               {1, 2, 0.5, 0.5, 1, 2, 1, 2, 0.5, 2, 1, 2, 1, 1, 1, 1, 1, 1},
               {1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1},
               {1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0.5, 0.5, 1, 1, 1, 0.5, 2},
               {1, 1, 1, 1, 0.5, 1, 0.5, 1, 2, 1, 2, 0.5, 1, 1, 1, 1, 1, 0.5},
               {1, 1, 2, 0, 2, 2, 1, 0.5, 1, 1, 1, 1, 0.5, 1, 1, 1, 1, 1},
               {1, 1, 1, 2, 0.5, 2, 0.5, 1, 0, 1, 1, 0.5, 2, 1, 1, 1, 1, 1},
               {1, 1, 1, 1, 1, 1, 0.5, 1, 1, 1, 1, 2, 1, 2, 1, 1, 2, 1},
               {1, 2, 1, 1, 0.5, 1, 0.5, 1, 0.5, 2, 1, 1, 2, 1, 1, 1, 1, 1},
               {0.5, 0.5, 2, 1, 2, 1, 2, 0.5, 2, 0.5, 1, 1, 1, 1, 1, 2, 1, 1},
               {0, 1, 1, 1, 1, 1, 0, 0.5, 1, 1, 1, 0.5, 1, 1, 1, 1, 2, 1},
               {1, 0.5, 0.5, 0.5, 0.5, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
               {0.5, 2, 1, 1, 0.5, 0.5, 2, 0, 2, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 1, 1, 0.5},
               {1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 0, 2, 1, 0.5, 1, 1, 1, 2},
               {1, 1, 1, 1, 1, 1, 0.5, 2, 1, 1, 1, 0.5, 1, 1, 0, 2, 0.5, 1}}

-- Calcul function
function calc(level_attacker, level_defender, para_attacker, burn_attacker, pois_attacker, gele_attacker, asle_attacker,
    para_defender, burn_defender, pois_defender, gele_defender, asle_defender, shin_attacker, shin_defender,
    lege_attacker, lege_defender, attacker, defender, attacker_2, defender_2)
    -- Level gap
    local gap = base + 2 * ((level_attacker <= 100 and level_attacker > 0 and level_attacker or 1) -
                    (level_defender <= 100 and level_defender > 0 and level_defender or 1))

    -- Status attacker
    gap = gap - (para_attacker and 5 or 0)
    gap = gap - (burn_attacker and 5 or 0)
    gap = gap - (pois_attacker and 5 or 0)
    gap = gap - (gele_attacker and 10 or 0)
    gap = gap - (asle_attacker and 5 or 0)

    -- Status defender
    gap = gap + (para_defender and 5 or 0)
    gap = gap + (burn_defender and 5 or 0)
    gap = gap + (pois_defender and 5 or 0)
    gap = gap + (gele_defender and 10 or 0)
    gap = gap + (asle_defender and 5 or 0)

    -- Shiny
    gap = gap + (shin_attacker and 10 or 0)
    gap = gap - (shin_defender and 10 or 0)

    -- Legendary
    gap = gap + (lege_attacker and 10 or 0)
    gap = gap - (lege_defender and 10 or 0)

    -- Type 1 attacker vs type 1 defender
    if types[defender][attacker] == 2 then
        gap = gap + 10
    elseif types[defender][attacker] == 0 then
        gap = gap - 20
    elseif types[defender][attacker] == 0.5 then
        gap = gap - 10
    end

    -- Type 1 attacker vs type 2 defender (only if exists)
    if defender_2 ~= nil then
        if types[defender_2][attacker] == 2 then
            gap = gap + 10
        elseif types[defender_2][attacker] == 0 then
            gap = gap - 20
        elseif types[defender_2][attacker] == 0.5 then
            gap = gap - 10
        end
    end

    -- Type 2 attacker (only if exists) vs type 2 defender (only if exists)
    if attacker_2 ~= nil and defender_2 ~= nil then
        if types[defender_2][attacker_2] == 2 then
            gap = gap + 10
        elseif types[defender_2][attacker_2] == 0 then
            gap = gap - 20
        elseif types[defender_2][attacker_2] == 0.5 then
            gap = gap - 10
        end
    end

    -- Type 2 attacker (only if exists) vs type 1 defender
    if attacker_2 ~= nil then
        if types[defender][attacker_2] == 2 then
            gap = gap + 10
        elseif types[defender][attacker_2] == 0 then
            gap = gap - 20
        elseif types[defender][attacker_2] == 0.5 then
            gap = gap - 10
        end
    end

    if gap < 0 then
        gap = 0
    elseif gap > 100 then
        gap = 100
    end

    return gap
end

-- Récupération des arguments de ligne de commande
local level_attacker = tonumber(arg[1])
local level_defender = tonumber(arg[2])
local para_attacker = arg[3] == "false"
local burn_attacker = arg[4] == "false"
local pois_attacker = arg[5] == "false"
local gele_attacker = arg[6] == "false"
local asle_attacker = arg[7] == "false"
local para_defender = arg[8] == "false"
local burn_defender = arg[9] == "false"
local pois_defender = arg[10] == "false"
local gele_defender = arg[11] == "false"
local asle_defender = arg[12] == "false"
local shin_attacker = arg[13] == "false"
local shin_defender = arg[14] == "false"
local lege_attacker = arg[15] == "false"
local lege_defender = arg[16] == "false"
local attacker = tonumber(arg[17])
local defender = tonumber(arg[18])
local attacker_2 = tonumber(arg[19])
local defender_2 = tonumber(arg[20])

level_attacker = 10
level_defender = 10
attacker = findIndex(pokemon_types, "Water")
attacker_2 = nil
defender = findIndex(pokemon_types, "Water")
defender_2 = nil

local resultat = calc(level_attacker, level_defender, para_attacker, burn_attacker, pois_attacker, gele_attacker,
    asle_attacker, para_defender, burn_defender, pois_defender, gele_defender, asle_defender, shin_attacker,
    shin_defender, lege_attacker, lege_defender, attacker, defender, attacker_2, defender_2)
print("Probability attacker :", dump(resultat))


local pkmn_list = {}
local Gengar = {
    type1 = "Poison",
    type2 = "Ghost"
}
local Tentacool = {
    type1 = "Poison",
    type2 = "Water"
}
local Nidoking = {
    type1 = "Poison",
    type2 = "Ground"
}
local Nidorino = {
    type1 = "Poison",
    type2 = nil
}
table.insert(pkmn_list, Gengar)
table.insert(pkmn_list, Gengar)
table.insert(pkmn_list, Gengar)
table.insert(pkmn_list, Gengar)
table.insert(pkmn_list, Gengar)
table.insert(pkmn_list, Gengar)
table.insert(pkmn_list, Nidoking)
table.insert(pkmn_list, Nidoking)
table.insert(pkmn_list, Nidoking)
table.insert(pkmn_list, Nidorino)
table.insert(pkmn_list, Nidorino)

-- Function to find the best type combo to beat the given list of Pokemon
function findBestTypeCombo(pkmn_list)
    local best_attacker = nil
    local best_attacker_2 = nil
    local best_probability = 0

    -- Iterate through all possible attacker type combinations
    for attacker = 1, #pokemon_types do
        for attacker_2 = 1, #pokemon_types do
            -- Skip the combination if the type1 and type2 are the same
            if attacker ~= attacker_2 then
                local probability = 0
                local total_probability = 0

                -- Calculate the probability of the attacker beating each defender
                for _, defender in ipairs(pkmn_list) do
                    local defender_type1 = findIndex(pokemon_types, defender.type1)
                    local defender_type2 = defender.type2 and findIndex(pokemon_types, defender.type2) or nil
                    local result = calc(10, 10, false, false, false, false, false, false, false, false, false, false, false, false, false, false, attacker, defender_type1, attacker_2, defender_type2)
                    probability = probability + result
                    total_probability = total_probability + 1
                end

                probability = probability / total_probability

                -- Update the best type combo if the current one has a higher probability
                if probability > best_probability then
                    best_attacker = attacker
                    best_attacker_2 = attacker_2
                    best_probability = probability
                end
            end
        end
    end

    return best_attacker, best_attacker_2, best_probability
end

-- Example usage
local best_attacker, best_attacker_2, best_probability = findBestTypeCombo(pkmn_list)
print("Best attacker type:", pokemon_types[best_attacker])
if best_attacker_2 then
    print("Best attacker type 2:", pokemon_types[best_attacker_2])
end
print("Best probability:", best_probability)
