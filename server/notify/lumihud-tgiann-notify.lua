if (Config.Notify == 'auto' and not checkResource('tgiann-lumihud')) or (Config.Notify ~= 'auto' and Config.Notify ~= 'tgiann-lumihud') then
    return
end

while not Bridge do
    Citizen.Wait(0)
end

if Config.Debug then
    lib.print.info('[Notify] Loaded: tgiann-lumihud')
end

Bridge.Notify = {}

Bridge.Notify.showNotify = function(playerId, message, type)
    if type == 'inform' or type == 'info' then
        type = 'primary'
    elseif type ~= 'error' and type ~= 'success' then
        type = 'primary'
    end

    TriggerClientEvent('bridge:lumihud:notify', playerId, message, type, 3000)
end
