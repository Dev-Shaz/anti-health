local webhook = "https://discord.com/api/webhooks/826389383258308608/6z414doeLJWinoiujOKJTnaxGl3lbTU8qM1oMfCskg0zAJsCFdH-_ZnruuX8fa8FOsys"   --- PUT YOUR WEBHOOK HERE
RegisterServerEvent("Anticheat:health")
AddEventHandler("Anticheat:health", function(a)
    local amount = a
    local src = source

    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "**Anticheat**",
            ["description"] = GetPlayerName(src) .. " added health \n Amount: " .. amount,

        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })

    DropPlayer(source, "[Anticheat] Health added") -- you might want to change to ban trigger ¯\_(ツ)_/¯
end)
