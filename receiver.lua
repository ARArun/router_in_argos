
function init()
    id = addr(robot.id)
    log(robot.id.." : "..id)
    robot.wheels.set_velocity(0,0)
end

function step()
    receive_message()
end

function reset()
end

function destroy()
    -- put your code here
end

---------------------------------------------------------------------

-- receives a message
function receive_message()
    if robot.range_and_bearing[1].data then
        message = robot.range_and_bearing[1].data
        log("receiver receiving: " .. message[2])
    end
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
