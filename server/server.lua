-- QBCore Exports --
local QBCore = exports['qb-core']:GetCoreObject()

-- Gift Box Useable Item Event --
QBCore.Functions.CreateUseableItem("giftbox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player.Functions.RemoveItem('giftbox') then return end
        TriggerClientEvent('mk-GiftBox:client:OpenGiftBox', src, item)
end)

-- Gift Box Rewards --
RegisterNetEvent('mk-GiftBox:server:GiftBoxRewards', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local RewardsTable = {}
    local TrackRewards = {}

    for i = 1, Config.MaxRewards do
        local ItemFound = false
        while not ItemFound do
            local Reward = Config.Rewards[math.random(#Config.Rewards)]
            if not TrackRewards[Reward.Name] then
                ItemFound = true
                TrackRewards[Reward.Name] = true
                table.insert(RewardsTable, {Name = Reward.Name, Amount = Reward.Amount})
            end
        end
    end

    for _, Reward in ipairs(RewardsTable) do
        Player.Functions.AddItem(Reward.Name, Reward.Amount)
        local RewardData = QBCore.Shared.Items[Reward.Name]
        TriggerClientEvent('inventory:client:ItemBox', src, RewardData, 'add', 1)
    end
end)