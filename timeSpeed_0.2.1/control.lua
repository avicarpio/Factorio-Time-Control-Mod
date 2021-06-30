local minSpeed = 0.25
local maxSpeed = 128

function getSpeed(tableIn)

    local player = game.get_player(tableIn.player_index)

    player.print("The current speed of the game is: " .. game.speed)

end

commands.add_command("get_speed", "This is a help command", getSpeed)

local function on_init()
    game.speed = 1
end

function changeSpeed(event, newTime)

    local newSpeed = game.speed

    if (newTime == 0) then
        newSpeed = 1
    else
        newSpeed = newSpeed * newTime
    end

    if(newSpeed < minSpeed) then
        newSpeed = minSpeed
    end

    if(newSpeed > maxSpeed) then 
        newSpeed = maxSpeed
    end

    game.speed = newSpeed

    game.print("Changed Speed to: " .. game.speed)

end

function extremeChange(event, isMin)

    local newSpeed = game.speed

    if isMin == 1 then
        if newSpeed == 0.25 then
            newSpeed = 1
        else
            newSpeed = 0.25
        end
    end

    if isMin == 0 then
        if newSpeed == 128 then
            newSpeed = 1
        else
            newSpeed = 128
        end        
    end

    game.speed = newSpeed

    game.print("Changed Speed to: " .. game.speed)

end

script.on_event("timeReset", function(event) return changeSpeed(event, 0) end)
script.on_event("timeSlower", function(event) return changeSpeed(event, 0.5) end)
script.on_event("timeFaster", function(event) return changeSpeed(event, 2) end)
script.on_event("timeSlower_min", function(event) return extremeChange(event, 1) end)
script.on_event("timeFaster_max", function(event) return extremeChange(event, 0) end)