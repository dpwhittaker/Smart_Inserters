local util = require("__core__/lualib/util")

local storage_functions = {}

global.SI_Storage = global.SI_Storage or {}

---@param player_index number
function storage_functions.add_player(player_index)
    global.SI_Storage[player_index] = {}
    ---@type SelectedInserter
    global.SI_Storage[player_index].selected_inserter = {
        ---@type LuaEntity
        inserter = nil,
        ---@type table<table<RenderedPosition>>
        displayed_elements = {}
    }
end

function storage_functions.populate_storage()
    for player_index, _ in pairs(game.players) do
        ---@diagnostic disable-next-line: param-type-mismatch
        storage_functions.add_player(player_index)
    end
    rendering.clear("Smart_Inserters")
end

---@param player_index number
---@return unknown
function storage_functions.ensure_data(player_index)
    global.SI_Storage = global.SI_Storage or {}

    if not global.SI_Storage[player_index] then
        storage_functions.add_player(player_index)
    end

    return global.SI_Storage[player_index]
end

return storage_functions