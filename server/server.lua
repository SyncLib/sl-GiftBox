-- QBCore Exports / Variables --
local QBCore = exports['qb-core']:GetCoreObject()

-- Gift Box Useable Item Event --
QBCore.Functions.CreateUseableItem("giftbox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player.Functions.RemoveItem('giftbox') then return end
        TriggerClientEvent('mk-GiftBox:OpenGiftBox', src, item)
end)

-- Gift Box Rewards --
RegisterNetEvent('mk-GiftBox:server:GiftBoxRewards', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemsTable = {}
    local givenRewards = {} -- keep track of given rewards

    for i = 1, Config.MaxRewards do
        local itemFound = false
        while not itemFound do
            local Item = Config.Rewards[math.random(#Config.Rewards)]
            if not givenRewards[Item.Name] then -- check if the item has already been given
                itemFound = true
                givenRewards[Item.Name] = true -- mark the item as given
                table.insert(ItemsTable, {Name = Item.Name, Amount = Item.Amount})
            end
        end
    end

    for _, Item in ipairs(ItemsTable) do
        Player.Functions.AddItem(Item.Name, Item.Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Item.Name], 'add', 1)
    end
end)