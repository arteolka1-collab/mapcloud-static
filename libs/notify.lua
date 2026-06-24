-- kladstub bulletproof notify.lua
-- Любой method call возвращает self → можно бесконечно цепочкой вызывать
-- nil-проверки не нужны: rawget/__index никогда не вернёт nil

local M = {}
local meta

local function _noop(...) return M end

meta = {
    __index = function(t, k)
        -- Любое обращение к полю возвращает функцию, которая возвращает M
        local f = function(...) return M end
        rawset(t, k, f)
        return f
    end,
    __call = function(t, ...) return M end,
    __newindex = function(t, k, v) rawset(t, k, v) end,
    __tostring = function() return "kladstub-notify-proxy" end,
}

setmetatable(M, meta)

-- Несколько стандартных констант если скрипт их читает напрямую как поля
M.Config = setmetatable({}, meta)
M._items = {}
M._next_id = 1
M._installed = true
M.NAME = "kladstub-notify-proxy"

return M
