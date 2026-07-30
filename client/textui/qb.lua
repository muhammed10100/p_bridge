if (Config.TextUI == 'auto' and not GetResourceState('qb-core') == 'started') or (Config.TextUI ~= 'auto' and Config.TextUI ~= 'qb-core') then
    return
end

-- Bridge (Köprü) objesinin hazır olmasını bekle
while not Bridge do
    Citizen.Wait(0)
end

if Config.Debug then
    print('^2[TextUI] Loaded: qb-core^7')
end

Bridge.TextUI = {}

-- QB-Core TextUI Gösterme Fonksiyonu
Bridge.TextUI.show = function(text)
    exports['qb-core']:DrawText(text, 'left')
end

-- QB-Core TextUI Gizleme Fonksiyonu
Bridge.TextUI.hide = function()
    exports['qb-core']:HideText()
end
