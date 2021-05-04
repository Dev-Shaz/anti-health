local healthtbl = 200

function sethealth(value)
    local ped = PlayerPedId()
    healthtbl = value
    SetEntityHealth(ped, value)
end

function removehealth(value)
    local ped = PlayerPedId()
    healthtbl = healthtbl - value
    ApplyDamageToPed(ped, value, false, true,true)
    SetEntityHealth(ped, value)
end

function addhealth(value)
    local ped = PlayerPedId()
    healthtbl = healthtbl + value
    local value = value + GetEntityHealth(ped)
    SetEntityHealth(ped, value)
end



Citizen.CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        Citizen.Wait(3000)
        if ped == PlayerPedId() then 
            local health = GetEntityHealth(ped)
            if health > healthtbl then
                local amount = health - healthtbl
                TriggerServerEvent("Anticheat:health", amount)
            end
            Wait(1000)
        end
        healthtbl = GetEntityHealth(PlayerPedId())
    end
end)




exports("sethealth", sethealth)

exports("removehealth", removehealth)

exports("addhealth", addhealth)
