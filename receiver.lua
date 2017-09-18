
function init()
    -- init the index
    index = 0
    id = addr(robot.id)
    log("id "..id)
    -- set the speed of the robot to zero
    robot.wheels.set_velocity(0,0)
end

-- actions for each step
function step()
    -- each step, take a different color
    receive_message()
end

-- reinitialize the controller
function reset()
    -- reinit the index
    index = 0
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
--------------------------------------------------------------------------------
function addr(s)
    i = 0
    id = 0
    for c in s:gmatch"." do
        id = id + (string.byte(c) * math.pow(32 , i))
        i = i + 1
    end
    log(id)
    id = math.fmod(id,251) + 1
    return id
end
