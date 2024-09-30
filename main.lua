local session_lib = require "session"

local session = session_lib.create(session_lib.default_action_handlers)

local function _create()
    return {
        value = 0
    }
end

local function _set(state, num)
    state.value = num
end

local function _get(state)
    print(type(state.value), state.value)
end

session:add_action_handler({
    command = "create",
    action = _create,
    help_message = "create a project",
    save_data = "state"
})
session:add_action_handler({
    command = "set",
    action = _set,
    help_message = "set the value",
    use_data = "state"
})
session:add_action_handler({
    command = "get",
    action = _get,
    help_message = "get the value",
    use_data = "state"
})

session:loop()

-- vim: nowrap ft=lua
