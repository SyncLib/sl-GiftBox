-- QBCore Exports --
local QBCore = exports['qb-core']:GetCoreObject()

-- Gift Box Progress Bar On-Opening --
RegisterNetEvent('sl-GiftBox:Client:OpenGiftBox', function(source)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "Stash", 0.25)
    QBCore.Functions.Progressbar('unwrapping_present', 'Unwrapping present', Config.ProgressBarInteger, false, true, {
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
end)