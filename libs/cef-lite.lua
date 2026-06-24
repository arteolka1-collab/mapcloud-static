-- kladstub bulletproof cef-lite.lua
local M = {}
local meta = {
    __index = function(t, k)
        local f = function(...) return M end
        rawset(t, k, f)
        return f
    end,
    __call = function(t, ...) return M end,
    __newindex = function(t, k, v) rawset(t, k, v) end,
}
setmetatable(M, meta)
M.NAME = "kladstub-cef-proxy"
return M
