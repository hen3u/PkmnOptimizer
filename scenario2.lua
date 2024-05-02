dofile("optimizer.lua")

local pkmn_list = {}
local trophy_type = "Poison"
local trophy_type_only = {
    type1 = trophy_type,
    type2 = nil
}
local steel_trophy_type = {
    type1 = trophy_type,
    type2 = "Steel"
}
local fight_trophy_type = {
    type1 = trophy_type,
    type2 = "Fighting"
}
local dragon_trophy_type = {
    type1 = trophy_type,
    type2 = "Dragon"
}
local water_trophy_type = {
    type1 = trophy_type,
    type2 = "Water"
}
local electric_trophy_type = {
    type1 = trophy_type,
    type2 = "Electric"
}
local fairy_trophy_type = {
    type1 = trophy_type,
    type2 = "Fairy"
}
local fire_trophy_type = {
    type1 = trophy_type,
    type2 = "Fire"
}
local bug_trophy_type = {
    type1 = trophy_type,
    type2 = "Bug"
}
local normal_trophy_type = {
    type1 = trophy_type,
    type2 = "Normal"
}
local grass_trophy_type = {
    type1 = trophy_type,
    type2 = "Grass"
}
local psychic_trophy_type = {
    type1 = trophy_type,
    type2 = "Psychic"
}
local rock_trophy_type = {
    type1 = trophy_type,
    type2 = "Rock"
}
local ground_trophy_type = {
    type1 = trophy_type,
    type2 = "Ground"
}
local ghost_trophy_type = {
    type1 = trophy_type,
    type2 = "Ghost"
}
local ghost2_trophy_type = {
    type1 = trophy_type,
    type2 = "Ghost"
}

local dark_trophy_type = {
    type1 = trophy_type,
    type2 = "Dark"
}
local flying_trophy_type = {
    type1 = trophy_type,
    type2 = "Flying"
}

local Gengar = {
    type1 = "Poison",
    type2 = "Ghost"
    -- legen = false
}

--5
table.insert(pkmn_list, dragon_trophy_type)
table.insert(pkmn_list, bug_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, dragon_trophy_type)
table.insert(pkmn_list, fairy_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
--10
table.insert(pkmn_list, psychic_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
table.insert(pkmn_list, dragon_trophy_type)
table.insert(pkmn_list, steel_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
--15
table.insert(pkmn_list, ghost_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, ground_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, ground_trophy_type)
--20
table.insert(pkmn_list, ground_trophy_type)
table.insert(pkmn_list, ground_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, ground_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
--25
table.insert(pkmn_list, ghost_trophy_type)
table.insert(pkmn_list, rock_trophy_type)
table.insert(pkmn_list, fairy_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
table.insert(pkmn_list, dragon_trophy_type)
--30
table.insert(pkmn_list, ghost_trophy_type)
table.insert(pkmn_list, trophy_type_only)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, trophy_type_only)
table.insert(pkmn_list, dark_trophy_type)
table.insert(pkmn_list, fairy_trophy_type)

--35
table.insert(pkmn_list, bug_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, ghost_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, dragon_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, water_trophy_type)
table.insert(pkmn_list, dark_trophy_type)

--40
table.insert(pkmn_list, dragon_trophy_type)
table.insert(pkmn_list, dragon_trophy_type)
table.insert(pkmn_list, trophy_type_only)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, ground_trophy_type)
pkmn_list[#pkmn_list].shiny = false
table.insert(pkmn_list, trophy_type_only)

--45
table.insert(pkmn_list, dragon_trophy_type)
pkmn_list[#pkmn_list].legen = true
table.insert(pkmn_list, bug_trophy_type)
table.insert(pkmn_list, steel_trophy_type)
pkmn_list[#pkmn_list].shiny = false
table.insert(pkmn_list, bug_trophy_type)
table.insert(pkmn_list, trophy_type_only)
pkmn_list[#pkmn_list].shiny = false

--50
table.insert(pkmn_list, ghost_trophy_type)
table.insert(pkmn_list, ghost_trophy_type)
pkmn_list[#pkmn_list].legen = true

-- Example usage
local best_attacker, best_attacker_2, best_probability = findBestTypeCombo(pkmn_list, trophy_type)
print("Best attacker type:", pokemon_types[best_attacker])
if best_attacker_2 then
    print("Best attacker type 2:", pokemon_types[best_attacker_2])
end
print("Best probability:", best_probability)