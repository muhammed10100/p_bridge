if (Config.Society == 'auto' and not checkResource('tgiann-bank')) or (Config.Society ~= 'auto' and Config.Society ~= 'tgiann-bank') then
    return
end

while not Bridge do
    Citizen.Wait(0)
end

if Config.Debug then
    lib.print.info('[Society] Loaded: tgiann-bank')
end

Bridge.Society = {}

Bridge.Society.addMoney = function(playerId, jobName, amount)
    -- Dokümantasyona göre: AddJobMoney(jobName, amount)
    local success = exports["tgiann-bank"]:AddJobMoney(jobName, amount)
    return success
end

Bridge.Society.removeMoney = function(playerId, jobName, amount)
    -- Dokümantasyona göre: RemoveJobMoney(jobName, amount)
    local success = exports["tgiann-bank"]:RemoveJobMoney(jobName, amount)
    return success
end

Bridge.Society.getMoney = function(playerId, jobName)
    -- Dokümantasyona göre: GetJobAccountBalance(jobName)
    local balance = exports["tgiann-bank"]:GetJobAccountBalance(jobName)
    return balance or 0
end
