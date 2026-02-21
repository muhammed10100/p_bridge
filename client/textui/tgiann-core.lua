if (Config.TextUI == 'auto' and not checkResource('tgiann-core')) or (Config.TextUI ~= 'auto' and Config.TextUI ~= 'tgiann-core') then
    return
end

while not Bridge do
    Citizen.Wait(0)
end

if Config.Debug then
    print('^2[TextUI] Loaded: tgiann-core^7')
end

Bridge.TextUI = {}

local textUICounter = 0

Bridge.TextUI.show = function(text, key)
    textUICounter = textUICounter + 1
    local uniqName = "bridge-textui-" .. textUICounter
    exports["tgiann-core"]:DrawTextOpen(uniqName, key or "E", text)
    return uniqName
end

Bridge.TextUI.hide = function(uniqName)
    if uniqName then
        exports["tgiann-core"]:DrawTextClose(uniqName)
    end
end
