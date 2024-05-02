dofile("optimizer.lua")

local pkmn_list = {}

local Pidgeot = {
    type1 = "Normal",
    type2 = "Flying"
}
local Arcanine = {
    type1 = "Fire",
    type2 = nil
}
local Rhyhorn = {
    type1 = "Ground",
    type2 = "Rock"
}
local Alakazam = {
    type1 = "Psychic",
    type2 = nil
}
local Gyarados = {
    type1 = "Water",
    type2 = "Flying"
}
local Ivysaur = {
    type1 = "Grass",
    type2 = "Poison"
}
local Blastoise = {
    type1 = "Water",
    type2 = nil
}
local Charizard = {
    type1 = "Fire",
    type2 = nil
}

table.insert(pkmn_list, Pidgeot)
table.insert(pkmn_list, Arcanine)
table.insert(pkmn_list, Rhyhorn)
table.insert(pkmn_list, Alakazam)
table.insert(pkmn_list, Gyarados)
table.insert(pkmn_list, Ivysaur)
table.insert(pkmn_list, Blastoise)
table.insert(pkmn_list, Charizard)

-- Example usage
local best_attacker, best_attacker_2, best_probability = findBestTypeCombo(pkmn_list, nil)
print("Best attacker type:", pokemon_types[best_attacker])
if best_attacker_2 then
    print("Best attacker type 2:", pokemon_types[best_attacker_2])
end
print("Best probability:", best_probability)
