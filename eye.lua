message = {0,0,0,0,0,0,0,0,0,0}
function init()

end

function step()
    receive_message()
    send_message(message)
end

function reset()

end

function destroy()

end

function receive_message()
    if robot.range_and_bearing[1].data then
        for i = 1, #robot.range_and_bearing do
            if robot.range_and_bearing[i].data[1] == 2 then
                message = robot.range_and_bearing[i].data
            end
        end
    end
end

function send_message(message)
    robot.range_and_bearing.set_data(message)
end
