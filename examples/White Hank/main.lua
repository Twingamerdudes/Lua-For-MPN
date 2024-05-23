local slowingDownTime = false
local canSlowDownTime = true
local summonedClone = false
local teleported = false
local ShowedLittleGreetingUI = false
local paused = false

function OnSceneLoaded(name)
    slowingDownTime = false
    canSlowDownTime = true
    summonedClone = false
    teleported = false
    SetTimeScale(1) -- Reset the time scale to normal.
    StopAllRunAfters() -- Stop any runafters that may have been running from the previous scene.
    DisableErrors() -- No one should see the errors of my bad programming when playing this mod.
    DestroyUI()
    if player ~= nil then
        ChangeBloom(1.11, 0.5)
        if GetField(player, "combatant") == "Hank W" then
            ChangeField(player, "attribute", {AttributeAction.MoveSpeed, 6.5}) --Reset the player's speed to normal.
            CreateUI()
        end
    end
    FixUI()
    teleported = false
end

function Callback(name, parameters)
    if name == "morph" then
        --Did the player morph White Hank? If so, create the UI, if not, destroy it.
        if parameters[3] == "Hank W" then
            if not Exists("timeUI") then
                CreateUI()
            end
        else
            DestroyUI()
        end
    end
end

--Fix anything we did to the UI
function FixUI()
    if Exists("timeUI") then
        ChangeCustomUIField("timeUI", "color", {{255, 255, 255}})
    end
    if Exists("teleportUI") then
        ChangeCustomUIField("teleportUI", "color", {{255, 255, 255}})
    end
end


--Remove the UI
function DestroyUI()
    if Exists("timeUI") then
        Destroy("timeUI")
    end
    if Exists("teleportUI") then
        Destroy("teleportUI")
    end
    if Exists("cloneUI") then
        Destroy("cloneUI")
    end
end

--Create the UI
function CreateUI()
    if not Exists("timeUI") then
        AddCustomImage("timeUI", "Time", {60, 1020})
        ChangeCustomUIField("timeUI", "scale", {{0.7, 0.7}})
    else
        ChangeCustomUIField("timeUI", "color", {{255, 255, 255}})
    end
    if not Exists("teleportUI") then
        AddCustomImage("teleportUI", "Teleport", {151, 1020})
        ChangeCustomUIField("teleportUI", "scale", {{0.7, 0.7}})
    else
        ChangeCustomUIField("teleportUI", "color", {{255, 255, 255}})
    end
    if not Exists("cloneUI") then
        AddCustomImage("cloneUI", "Grunt", {242, 1020})
        ChangeCustomUIField("cloneUI", "scale", {{0.7, 0.7}})
    end
end

--Unapply the time stop ability
function HandleAbility()
    SetTimeScale(1)
    ChangeBloom(1.11, 0.5)
    slowingDownTime = false
    canSlowDownTime = false
    ChangeField(player, "attribute", {AttributeAction.MoveSpeed, GetField(player, "attribute", {AttributeAction.MoveSpeed}) / 2})
    PlaySound("dio-time-stop-reverse.wav")
    ChangeCustomUIField("timeUI", "color", {{100, 100, 100}})
    RunAfter(20, Cooldown)
end

--Time stop cooldown
function Cooldown()
    canSlowDownTime = true
    ChangeCustomUIField("timeUI", "color", {{255, 255, 255}})
end

function OnUpdate()
    if player ~= nil then
        if not ShowedLittleGreetingUI then
            ShowedLittleGreetingUI = true
            RunAfter(5, function()
                CreateUIMenu("greeting", "Thanks for installing White Hank mod!", "This mod adds abilities to the Hank W (White Hank) character, to make her more like the White Hank in animation series. \n\nWhite Hank ability keybinds:\nX to slow down time\n C to summon a clone\n V to teleport to where you are aiming your reticle (that little yellow square).")
                AddButton("greeting", "Close", function()
                    CloseUIMenu("greeting")
                end)
            end)
        end
        --Is the player White Hank? If so, check for key presses.
        if GetField(player, "combatant") == "Hank W" then
            --IF FOR SOME UNGODLY REASON, THE UI DOESN'T EXIST, CREATE IT!!!!
            if not Exists("timeUI") then
                CreateUI()
            end
            --If the player wants to time stop and we can, do it.
            if GetKeyDown(KeyCode.X) and not slowingDownTime and canSlowDownTime then
                SetTimeScale(0.5)
                ChangeBloom(2)
                ChangeField(player, "attribute", {AttributeAction.MoveSpeed, GetField(player, "attribute", {AttributeAction.MoveSpeed}) * 2})
                slowingDownTime = true
                RunAfter(4.6, HandleAbility)
                PlaySound("dio-time-stop.wav")
                if Exists("timeUI") then
                    ChangeCustomUIField("timeUI", "color", {{173, 216, 230}})
                end
            end

            --If the player hasn't summoned a clone, and they press X, summon a clone.
            if GetKeyDown(KeyCode.C) and not summonedClone then
                summonedClone = true

                local combatant = SpawnCombatant("Hank W", GetField(player, "position"), GetFaction(player)) -- Someone's a father now
                if GetField(player, "weapon") ~= nil then
                    ChangeField(combatant[1], "weapon", {GetField(player, "weapon"), 0, 0})
                end
                SpawnParticle("Confetti_Magic", GetField(combatant[1], "position"))
                AddToSquad(combatant[1], GetField(player, "squad"))

                if Exists("cloneUI") then
                    Destroy("cloneUI")
                end

                --After 10 seconds, remove the clone from the squad and kill it.
                RunAfter(10, function()
                    RemoveFromSquad(combatant[1])
                    if GetField(combatant[1], "weapon") ~= nil then
                        ChangeField(combatant[1], "weapon", {"None", 0, 0})
                    end
                    KillCombatant(combatant[1])
                end)
            end

            --If the player presses C, teleport them to the position of the reticle (basically the mouse cursor)
            if GetKeyDown(KeyCode.V) and not teleported then
                SpawnParticle("Confetti_Magic", GetField(player, "position"))
                ChangeField(player, "position", {GetReticlePosition()})
                teleported = true
                SpawnParticle("Confetti_Magic", GetField(player, "position"))
                if Exists("teleportUI") then
                    ChangeCustomUIField("teleportUI", "color", {{100, 100, 100}})
                end

                --Cooldown for teleporting
                RunAfter(10, function()
                    teleported = false
                    if Exists("teleportUI") then
                        ChangeCustomUIField("teleportUI", "color", {{255, 255, 255}})
                    end
                end)
            end
        else
            DestroyUI()
        end
        if timeScale == 0 then
            paused = true
        else
            if paused then
                if slowingDownTime then
                    SetTimeScale(0.5)
                end
            end
            paused = false
        end
    end
end