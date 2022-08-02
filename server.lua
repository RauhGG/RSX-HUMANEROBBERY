ESX = exports['es_extended']:getSharedObject()
local robbed = false
RegisterServerEvent('rsx_humane:robbing', function()
    TriggerClientEvent('rsx_humane:settext', -1, '~r~Ya hay alguien robando~w~')
end)

RegisterServerEvent('rsx_humane:empaquetar', function()
    local src = source
    local cops = 0
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'police' then
            cops = cops + 1
        end
    end
    print(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    robbed = true
    if cops >= 6 then
        xPlayer.addInventoryItem('adnsec', 1)
            TriggerClientEvent('rsx_humane:settext', -1, '~r~Ya no hay más secuenciadores~w~')
        end
end)