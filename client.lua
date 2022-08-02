ESX = exports['es_extended']:getSharedObject()
local stoled = false
local robtext = "~INPUT_CONTEXT~ Empaquetar secuenciador de ADN"

Config = {}

Config.robberypoint = vector3(3537.337,3662.517,28.448)


CreateThread(function()
    while true do
        local _sleep = 1000
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dist = #(plyCoords - Config.robberypoint)
        if dist < 2 and not stoled then
            _sleep = 0
            ESX.ShowFloatingHelpNotification(robtext, Config.robberypoint)
            TriggerServerEvent('rsx_humane:inpoint')
            if IsControlJustPressed(0, 38) then
                TriggerServerEvent('rsx_humane:robbing')
                stoled = true
                empaquetar()
            end
        elseif stoled then
            _sleep = 0
            ESX.ShowFloatingHelpNotification('~r~Ya no hay más producto~w~', Config.robberypoint)
        end
        Wait(_sleep)
    end
end)

CreateThread(function()
    while true do
        local _sleep = 1000
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dist1 = #(plyCoords - vector3(3540.603,3675.384,20.992))
        local dist2 = #(plyCoords - vector3(3540.603,3675.384,27.992))
        if dist1 < 2 then
            _sleep = 0
            ESX.ShowFloatingHelpNotification('~INPUT_CONTEXT~ Subir', vector3(3540.603,3675.384,20.992) )
            if IsControlJustPressed(0, 38) then
                SetEntityCoords(ply, vector3(plyCoords.x,plyCoords.y, 27.992 - 1 ))
            end
        end
        if dist2 < 2 then
            _sleep = 0
            ESX.ShowFloatingHelpNotification('~INPUT_CONTEXT~ Bajar', vector3(3540.603,3675.384,27.992) )
            if IsControlJustPressed(0, 38) then
                SetEntityCoords(ply, vector3(plyCoords.x,plyCoords.y, 20.992 - 1 ))
            end
        end
        Wait(_sleep)
    end
end)

function empaquetar(source)
    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
    Wait(40000)
    ClearPedTasks(PlayerPedId())
    TriggerServerEvent('rsx_humane:empaquetar')
    ExecuteCommand('entorno Alarma de Humane activada')
end

RegisterCommand('cleartask', function(source, args, raw)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('rsx_humane:settext', function(text)
    robtext = text
end)