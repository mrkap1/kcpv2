local RESOURCE_NAME = GetCurrentResourceName()
local LOCAL_VERSION = GetResourceMetadata(RESOURCE_NAME, 'version') -- Get version from fxmanifest.lua
local REMOTE_VERSION_URL = 'https://github.com/MrKap1/KCPv2/blob/main/latest_version.txt' -- e.g., 'https://raw.githubusercontent.com/your-username/your-repo/main/latest_version.txt'

function CheckForUpdates()
    PerformHttpRequest(REMOTE_VERSION_URL, function(statusCode, responseText, headers)
        if statusCode == 200 then
            local latestVersion = responseText:gsub('%s', '') 
            if latestVersion ~= LOCAL_VERSION then
                print('^3[' .. RESOURCE_NAME .. ']^0 ^1ATTENTION:^0 A new update is available! Your version: ' .. LOCAL_VERSION .. ' | Latest version: ' .. latestVersion)
                print('^3[' .. RESOURCE_NAME .. ']^0 Please download the latest version')
            else
			    print('^2[' .. RESOURCE_NAME .. ']^0 ░██     ░██    ░███    ░█████████  ')
				print('^2[' .. RESOURCE_NAME .. ']^0 ░██    ░██    ░██░██   ░██     ░██   ')
				print('^2[' .. RESOURCE_NAME .. ']^0 ░██   ░██    ░██  ░██  ░██     ░██')
				print('^2[' .. RESOURCE_NAME .. ']^0 ░███████    ░█████████ ░█████████  ')
				print('^2[' .. RESOURCE_NAME .. ']^0 ░██   ░██   ░██    ░██ ░██         ')
				print('^2[' .. RESOURCE_NAME .. ']^0 ░██    ░██  ░██    ░██ ░██        ')
				print('^2[' .. RESOURCE_NAME .. ']^0 ░██     ░██ ░██    ░██ ░██      ')
                print('^2[' .. RESOURCE_NAME .. ']^0 Resource is up to date (v' .. LOCAL_VERSION .. ')')
            end
        else
            print('^3[' .. RESOURCE_NAME .. ']^0 Failed to check for updates. Status Code: ' .. statusCode)
        end
    end)
end

Citizen.CreateThread(function()    
    Citizen.Wait(10000) 
    while true do
        CheckForUpdates()
        Citizen.Wait(3600000) 
    end
end)

