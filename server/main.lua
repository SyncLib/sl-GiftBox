-- QBCore Exports / Variables --
local QBCore = exports['qb-core']:GetCoreObject()

-- Gift Box Useable Item Event --
QBCore.Functions.CreateUseableItem("giftbox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        Player.Functions.RemoveItem('giftbox', 1)
        TriggerClientEvent('mk-GiftBox:OpenGiftBox', src, item)
    end
end)

-- Gift Box Rewards --
RegisterNetEvent('mk-GiftBox:server:GiftBoxRewards', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemsTable = {}

    for i = 1, Config.MaxRewards do
        local Item = Config.Rewards[math.random(#Config.Rewards)]
        table.insert(ItemsTable, {Name = Item.Name, Amount = Item.Amount})
    end

    for _, Item in ipairs(ItemsTable) do
        Player.Functions.AddItem(Item.Name, Item.Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Item.Name], 'add', 1)
    end
end)
