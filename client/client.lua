-- Framework Detection
local Framework = nil
if GetResourceState('qb-core') == 'started' then
    Framework = exports['qb-core']:GetCoreObject()
elseif GetResourceState('qbx_core') == 'started' then
    Framework = exports['qbx_core']:GetCoreObject()
end

-- Gift Box Progress Bar On-Opening
RegisterNetEvent('sl-GiftBox:Client:OpenGiftBox', function(source)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "Stash", 0.25)

    if Framework then
        Framework.Functions.Progressbar('unwrapping_present', 'Unwrapping present', Config.ProgressBarInteger, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@gangops@facility@servers@',
            anim = 'hotwire',
            flags = 17,
        }, {}, {}, function() -- Play when Done
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('sl-GiftBox:Server:GiftBoxRewards')
        end, function() -- Play When Cancel
            ClearPedTasks(PlayerPedId())
        end)
    else
        print("^1[sl-GiftBox] Framework not detected or not supported!^0")
    end
end)
