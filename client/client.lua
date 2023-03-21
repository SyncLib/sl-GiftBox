-- QBCore Exports --
local QBCore = exports['qb-core']:GetCoreObject()

-- Gift Box Progress Bar On-Opening --
RegisterNetEvent('mk-GiftBox:OpenGiftBox', function(source)
    local src = source
    QBCore.Functions.Progressbar('unwrapping_present', 'Unwrapping present', Config.ProgressBarInteger, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
    animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 17,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('mk-GiftBox:server:GiftBoxRewards')
    end)
end)