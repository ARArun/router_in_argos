
function init()
    id = addr(robot.id)
    log(robot.id.." : "..id)
    robot.wheels.set_velocity(0,0)
end

-- actions for each step
function step()
    -- each step, send a message
    send_message()
end

-- reinitialize the controller
function reset()
end

function destroy()
    -- put your code here
end

---------------------------------------------------------------------

-- sends the message "2" via range and bearing
function send_message()
    index = 2
    message = 2
    robot.range_and_bearing.set_data(index, message)
    log("sender sending: " .. message)
end

--------------------------------------------------------------------------------
------------------------------Hash function-------------------------------------
--------------------------------------------------------------------------------
function addr(s)
    i = 0
    id = 0
    for c in s:gmatch"." do
        id = id + (string.byte(c) * math.pow(2 , i))
        i = i + 1
    end
    log(id)
    id = math.fmod(id,251) + 1
    return id
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
