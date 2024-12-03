-- Framework Detection
local Framework = nil
if GetResourceState('qb-core') == 'started' then
    Framework = exports['qb-core']:GetCoreObject()
elseif GetResourceState('qbx_core') == 'started' then
    Framework = exports['qbx_core']:GetCoreObject()
end

-- Detect Inventory System
local UseOxInventory = GetResourceState('ox_inventory') == 'started'

-- Gift Box Useable Item Event
        Framework.Functions.CreateUseableItem("giftbox", function(source, item)
            local src = source
            local Player = Framework.Functions.GetPlayer(src)
            if Player.Functions.RemoveItem('giftbox', 1) then
                TriggerClientEvent('sl-GiftBox:Client:OpenGiftBox', src, item)
            end
        end)

-- Gift Box Rewards
RegisterNetEvent('sl-GiftBox:Server:GiftBoxRewards', function()
    local src = source
    local Player = Framework.Functions.GetPlayer(src)
    local MaxRewards = Config.MaxRewards
    local RewardsTable = {}
    local TrackRewards = {}

    while #RewardsTable < MaxRewards do
        local Reward = Config.Rewards[math.random(#Config.Rewards)]
        if not TrackRewards[Reward.Name] then
            TrackRewards[Reward.Name] = true
            RewardsTable[#RewardsTable + 1] = { Name = Reward.Name, Amount = Reward.Amount }
        end
    end

    for _, Reward in ipairs(RewardsTable) do
        if UseOxInventory then
            exports.ox_inventory:AddItem(src, Reward.Name, Reward.Amount)
        else
            Player.Functions.AddItem(Reward.Name, Reward.Amount)
        end

        local RewardData = UseOxInventory 
            and exports.ox_inventory:Items()[Reward.Name] 
            or Framework.Shared.Items[Reward.Name]
        
        TriggerClientEvent('inventory:client:ItemBox', src, RewardData, 'add', Reward.Amount)
    end
end)

-- Server Event to Handle Ox_Inventory Item Usage
RegisterNetEvent('sl-GiftBox:Server:UseGiftBox', function(item)
    local src = source
    if exports.ox_inventory:RemoveItem(src, 'giftbox', 1) then
        TriggerClientEvent('sl-GiftBox:Client:OpenGiftBox', src, item)
    end
end)

