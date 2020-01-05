local function calc_reload_time(max_uses)
    -- 60 = 1s
    return 10 * 60 / max_uses
end

for i, action in ipairs(actions) do
    local max_uses = action.max_uses
    if max_uses ~= nil then
        local old_action_fn = action.action
        action.max_uses = nil
        action.action = function()
            if old_action_fn ~= nil then old_action_fn() end
            current_reload_time = current_reload_time + calc_reload_time(max_uses)
        end
    end
end
