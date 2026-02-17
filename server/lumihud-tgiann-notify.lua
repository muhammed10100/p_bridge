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
    -- Tgiann LumiHud için tip (type) dönüşümleri
    -- QB 'inform' veya 'primary' kullanırken, Tgiann genelde 'info' kullanır.
    if type == 'inform' or type == 'primary' then
        type = 'info'
    end
    
    -- Eğer 'success' veya 'error' gelirse olduğu gibi kalır, ancak emin olmak için kontrol edebilirsiniz.
    -- type seçenekleri genelde: 'success', 'error', 'warning', 'info'

    local time = 5000 -- Bildirimin ekranda kalma süresi (milisaniye cinsinden)

    -- Dokümantasyona uygun Server -> Client tetikleyicisi
    -- Parametreler: source, type, message, time
    TriggerClientEvent('tgiann-lumihud:client:sendNotification', playerId, type, message, time)
end
