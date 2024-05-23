local cristalAnimation = false
local currentScale = {}
local opacity = 0
local fade = false
function OnSceneLoaded(sceneName)
    cristalAnimation = false
    currentScale = {}
    opacity = 0
    fade = false
    KillAudioSources()
    StopAllRunAfters()
end

function Callback(name, args)
    if name == "death" then
        SpawnWeapon("Cristal", GetField(args[1], "position"))
        if not Exists("music.wav") then
            PlaySound("music.wav", 1)
            RunAfter(4, function ()
                AddCustomImage("CristalImage", "Cristal", {960, 540}, {255, 255, 255, 0})
                ChangeCustomUIField("CristalImage", "scale", {{2, 2}})
                currentScale = {2, 2}
                cristalAnimation = true
            end)
            RunAfter(8.531, function ()
                Destroy("music.wav")
            end)
        end
    end
end
function OnUpdate()
    if cristalAnimation then
        if currentScale[1] <= 3 then
            currentScale[1] = currentScale[1] + 0.4 * deltaTime
            currentScale[2] = currentScale[2] + 0.4 * deltaTime
            opacity = opacity + 150 * deltaTime
            ChangeCustomUIField("CristalImage", "scale", {{currentScale[1], currentScale[2]}})
            ChangeCustomUIField("CristalImage", "color", {{255, 255, 255, opacity}})
        elseif fade then
            opacity = opacity - 150 * deltaTime
            ChangeCustomUIField("CristalImage", "color", {{255, 255, 255, opacity}})
            if opacity <= 0 then
                cristalAnimation = false
                fade = false
                opacity = 0
                currentScale = {}
                Destroy("CristalImage")
            end
        end
        if not Exists("music.wav") then
            fade = true
        end
    end
end