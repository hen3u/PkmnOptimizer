dofile("optimizer-lib.lua")

local pokemon_types = {"Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground", "Flying",
                       "Psychic", "Bug", "Rock", "Ghost", "Dragon", "Dark", "Steel", "Fairy"}

local damage_array = {{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 / 2, 0, 1, 1, 1 / 2, 1},
                      {1, 1 / 2, 1 / 2, 1, 2, 2, 1, 1, 1, 1, 1, 2, 1 / 2, 1, 1 / 2, 1, 2, 1},
                      {1, 2, 1 / 2, 1, 1 / 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1 / 2, 1, 1, 1},
                      {1, 1, 2, 1 / 2, 1 / 2, 1, 1, 1, 0, 2, 1, 1, 1, 1, 1 / 2, 1, 1, 1},
                      {1, 1 / 2, 2, 1, 1 / 2, 1, 1, 1 / 2, 2, 1 / 2, 1, 1 / 2, 2, 1, 1 / 2, 1, 1 / 2, 1},
                      {1, 1 / 2, 1 / 2, 1, 2, 1 / 2, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 1 / 2, 1},
                      {2, 1, 1, 1, 1, 2, 1, 1 / 2, 1, 1 / 2, 1 / 2, 1 / 2, 2, 0, 1, 2, 2, 1 / 2},
                      {1, 1, 1, 1, 2, 1, 1, 1 / 2, 1 / 2, 1, 1, 1, 1 / 2, 1 / 2, 1, 1, 0, 2},
                      {1, 2, 1, 2, 1 / 2, 1, 1, 2, 1, 0, 1, 1 / 2, 2, 1, 1, 1, 2, 1},
                      {1, 1, 1, 1 / 2, 2, 1, 2, 1, 1, 1, 1, 2, 1 / 2, 1, 1, 1, 1 / 2, 1},
                      {1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1 / 2, 1, 1, 1, 1, 0, 1 / 2, 1},
                      {1, 1 / 2, 1, 1, 2, 1, 1 / 2, 1 / 2, 1, 1 / 2, 2, 1, 1, 1 / 2, 1, 2, 1 / 2, 1 / 2},
                      {1, 2, 1, 1, 1, 2, 1 / 2, 1, 1 / 2, 2, 1, 2, 1, 1, 1, 1, 1 / 2, 1},
                      {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1 / 2, 1, 1},
                      {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1 / 2, 0},
                      {1, 1, 1, 1, 1, 1, 1 / 2, 1, 1, 1, 2, 1, 1, 2, 1, 1 / 2, 1, 1 / 2},
                      {1, 1 / 2, 1 / 2, 1 / 2, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1 / 2, 2},
                      {1, 1 / 2, 1, 1, 1, 1, 2, 1 / 2, 1, 1, 1, 1, 1, 1, 2, 2, 1 / 2, 1}}

local pkmn_list = {}
table.insert(pkmn_list, {
    atk_type1 = "Fire",
    atk_type2 = nil,
    def_type1 = "Grass"
})
table.insert(pkmn_list, {
    atk_type1 = "Fire",
    atk_type2 = nil,
    def_type1 = "Water"
})

for i, pkmn in ipairs(pkmn_list) do
    local atk_type1
    local atk_type2
    local def_type1
    local def_type2
    if pkmn.atk_type1 then
        atk_type1 = findIndex(pokemon_types, pkmn.atk_type1)
    end
    if pkmn.atk_type2 then
        atk_type2 = findIndex(pokemon_types, pkmn.atk_type2)
    end
    if pkmn.def_type1 then
        def_type1 = findIndex(pokemon_types, pkmn.def_type1)
    end
    if pkmn.def_type2 then
        def_type2 = findIndex(pokemon_types, pkmn.def_type2)
    end
    log.info("atk_type1 : " .. dump(atk_type1))
    log.info("atk_type2 : " .. dump(atk_type2))
    log.info("def_type1 : " .. dump(def_type1))
    log.info("def_type2 : " .. dump(def_type2))

    -- Check atk_type1 vs def_type1
    if atk_type1 and def_type1 then
        log.debug("damage 1 : " .. dump(damage_array[atk_type1][def_type1]))
    end

    -- Check atk_type1 vs def_type2
    if atk_type1 and def_type2 then
        log.debug("damage 2 : " .. dump(damage_array[atk_type1][def_type2]))
    end

    -- Check atk_type2 vs def_type1
    if atk_type2 and def_type1 then
        log.debug("damage 3 : " .. dump(damage_array[atk_type2][def_type1]))
    end

    -- Check atk_type2 vs def_type2
    if atk_type2 and def_type2 then
        log.debug("damage 4 : " .. dump(damage_array[atk_type2][def_type2]))
    end
end
