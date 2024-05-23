---@meta

---Display a message in the notify UI.
---@param message string
function Notice(message) end

---Get all combatants in the scene. You can filter by the name of combatant (ex. Sanford), filter can be nil
---@param filter? string[]
---@return string[]
function GetCombatants(filter) end

---Checks if a key is pressed.
---@param keyCode KeyCode
---@return boolean
function GetKeyDown(keyCode) end

---Checks if a key is released.
---@param keyCode KeyCode
---@return boolean
function GetKeyUp(keyCode) end

---Checks if a key is held.
---@param keyCode KeyCode
---@return boolean
function GetKey(keyCode) end

---Changes a field of an object.
---@param objectName string
---@param field string
---@param values any[]
function ChangeField(objectName, field, values) end

---Gets a field of an object.
---@param objectName string
---@param field string
---@param parameters? any[]
---@return any
function GetField(objectName, field, parameters) end

---Disables AI on a combatant.
---@param objectName string
function DisableAI(objectName) end

---Enables AI on a combatant.
---@param objectName string
function EnableAI(objectName) end

---Moves a combatant to a position.
---@param objectName string
---@param position number[]
function MoveCombatant(objectName, position) end

---Gets the position of the cursor (aiming reticle) in world space.
---@return number[]
function GetReticlePosition() end

---Sets the faction of a combatant.
---@param objectName string
---@param faction Factions
function SetFaction(objectName, faction) end

---Gets the faction of a combatant.
---@param objectName string
---@return Factions
function GetFaction(objectName) end

---Checks if a mouse button is pressed.
---@param mouseButton MouseButtons
---@return boolean
function GetMouseButtonDown(mouseButton) end

---Checks if a mouse button is released.
---@param mouseButton MouseButtons
---@return boolean
function GetMouseButtonUp(mouseButton) end

---Checks if a mouse button is held.
---@param mouseButton MouseButtons
---@return boolean
function GetMouseButton(mouseButton) end

---Narrates a line using narration UI.
---@param combatantName string
---@param line string
function NarrateLine(combatantName, line) end

---Checks if a line is being narrated.
---@return boolean
function IsNarratingLine() end

---Creates a UI menu.
---@param name string
---@param title string
---@param subheading? string
---@param pauseGame? boolean
function CreateUIMenu(name, title, subheading, pauseGame) end

---Closes a UI menu.
---@param name string
function CloseUIMenu(name) end

---Adds a list to a UI menu.
---@param name string
---@param list string[]
---@param callback function
function AddList(name, list, callback) end

---Adds a button to a UI menu.
---@param name string
---@param text string
---@param callback function
function AddButton(name, text, callback) end

---Plays a sound (does not loop).
---@param fileName string
---@param volume? number
function PlaySound(fileName, volume) end

---Plays a music file (loops).
---@param filename string
---@param volume? number
function PlayMusic(filename, volume) end

---Destroys all audio sources.
function KillAudioSources() end

---Sets the alert status of a combatant.
---@param combatant string
---@param status AlertStatus
function SetAlertStatus(combatant, status) end

---Gets the alert status of a combatant.
---@param combatant string
---@return AlertStatus
function GetAlertStatus(combatant) end

---Kills a combatant.
---@param combatant string
function KillCombatant(combatant) end

---Spawns a combatant at a position, and returns its name and squad name.
---@param combatant string
---@param position number[]
---@param faction Factions
---@return string[]
function SpawnCombatant(combatant, position, faction) end

---Spawns a combatant at a random entrance of the scene, and returns its name and squad name.
---@param combatant string
---@param faction Factions
---@return string[]
function SpawnCombatantAtEntrance(combatant, faction) end

---Drops a weapon from a combatant at the specified slot and hand.
---@param player string
---@param slot? number
---@param hand? number
function DropWeapon(player, slot, hand) end

---Spawns a weapon at a position.
---@param weapon string
---@param position number[]
function SpawnWeapon(weapon, position) end

---Spawns a Mad Object with a name, position, rotation, and scale.
---@param name string
---@param madObjName string
---@param position number[]
---@param rotation? number[]
---@param scale? number[]
function SpawnMadObj(name, madObjName, position, rotation, scale) end

---Change the bloom settings.
---@param intensity? number
---@param threshold? number
---@param blurIterations? number
---@param quality? BloomQuality
function ChangeBloom(intensity, threshold, blurIterations, quality) end

---Opens or closes a entrance.
---@param entrance string
---@param state boolean
function SetEntranceOpenState(entrance, state) end

---Locks or unlocks a entrance.
---@param entrance string
---@param state boolean
function SetEntranceLock(entrance, state) end

---Gets all entrances in the scene.
---@param onlyLocalRoomDoors? boolean
---@return string[]
function GetAllEntrances(onlyLocalRoomDoors) end

---Announces something.
---@param title string
---@param subtitle string
---@param type AnnouncementTypes
function Announce(title, subtitle, type) end

---Toggles a toggleable object
---@param toggleable string
---@param toggle boolean
function ToggleToggleable(toggleable, toggle) end

---Creates a new trigger object in the scene
---@param name string
---@param position number[]
---@param size number[]
---@param onlyTriggedByPlayer? boolean
---@param triggerOnce? boolean
function AddTrigger(name, position, size, onlyTriggedByPlayer, triggerOnce) end

---Sets the rate of fire of a weapon.
---@param weapon string
---@param rof number
function SetROF(weapon, rof) end

---Gets the rate of fire of a weapon.
---@param weapon string
---@return number
function GetROF(weapon) end

---Forces a combatant to reload their weapon.
---@param combatant string
function Reload(combatant) end

---Runs a function after a certain amount of time.
---@param time number
---@param callback function
---@param parameters? any[]
function RunAfter(time, callback, parameters) end

---Makes a combatant emote.
---@param combatant string
---@param emote Emotes
---@param direction? number[]
function Emote(combatant, emote, direction) end

---Plays music from a FMOD bank
---@param event string
---@param volume? number
function PlayMusicFMOD(event, volume) end

---Sets if a weapon is automatic
---@param weapon string
---@param automatic boolean
function SetAutomatic(weapon, automatic) end

---Gets if a weapon is automatic
---@param weapon string
---@return boolean
function GetAutomatic(weapon) end

---Sets the primary color tints of a combatant (this resets player global, so make sure that if you run any player code right after this to run it with a delay of 0.01)
---@param combatant string
---@param tints number[][]
function SetPrimaryColorTints(combatant, tints) end

---Sets the secondary color tints of a combatant (this resets player global, so make sure that if you run any player code right after this to run it with a delay of 0.01)
---@param combatant string
---@param tints number[][]
function SetSecondaryColorTints(combatant, tints) end

---Changes the rate at which time passes.
---@param scale number
function SetTimeScale(scale) end

---Gets all names of combatants in the game
---@return string[]
function GetAllCharacterStatcards() end

---Gets all names of weapons in the game
---@return string[]
function GetAllWeaponStatcards() end

---Stops all RunAfter functions
function StopAllRunAfters() end

---Destroys a object
---@param object string
function Destroy(object) end

---Adds a combatant to a squad
---@param combatant string
---@param squad string
function AddToSquad(combatant, squad) end

---Removes a combatant from a squad
---@param combatant string
function RemoveFromSquad(combatant) end

---Gets all combatants in a squad
---@param squad string
---@return string[]
function GetAllCombatantsInSquad(squad) end

---Forces the game to save
function SaveGame() end

---Disables error messages (ONLY USE WHEN YOU ARE PUBLISHING A MOD AND WHEN YOU ARE SURE THAT IT WORKS PROPERLY)
function DisableErrors() end

---Enables error messages
function EnableErrors() end

---Saves data to steam cloud
---@param data any[]
function SaveCustomCloudData(data) end

---Loads data from steam cloud
---@return any[]
function LoadCustomCloudData() end

---Deletes your lua data from steam cloud
function DeleteCloudData() end

---Adds a button to the Unity canvas
---@param name string
---@param text string
---@param position number[]
---@param callback function
---@param fontName? string
---@param spriteName? string
---@param color? table[]
function AddCustomButton(name, text, position, callback, fontName, spriteName, color) end

---Changes a field of a Unity UI object
---@param name string
---@param field string
---@param values any[]
function ChangeCustomUIField(name, field, values) end

---Checks if a object exists
---@param name string
---@return boolean
function Exists(name) end

---Gets the primary tints of a statcard
---@param combatant string
---@return number[][]
function GetPrimaryColorTints(combatant) end

---Gets the secondary tints of a statcard
---@param combatant string
---@return number[][]
function GetSecondaryColorTints(combatant) end

---Creates text on the Unity UI
---@param name string
---@param text string
---@param position number[]
---@param color? number[]
---@param fontSize? number
---@param fontName? string
function AddCustomText(name, text, position, color, fontSize, fontName) end

---Creates an image on the Unity UI
---@param name string
---@param textureName string
---@param position number[]
---@param color? number[]
function AddCustomImage(name, textureName, position, color) end

--Plays an animation clip as an emote
---@param combatant string
---@param animName string
function PlayAnimAsEmote(combatant, animName) end

---Sets the parent of an object
---@param name string
---@param parentName string
function SetParent(name, parentName) end

---Gets the parent of an object
---@param name string
---@return string
function GetParent(name) end

--Creates an empty game object
---@param name string
---@param position number[]
function CreateEmpty(name, position) end

--Spawns a particle effect at a position
---@param name string
---@param position number[]
function SpawnParticle(name, position) end

--Gets all file paths in a directory
---@param directory string
---@return string[]
function GetAllFilesFromDirectory(directory) end

--Loads a WAV file into the internal AudioClips list from a path dynamically
---@param fileName string
function LoadWAV(fileName) end

--Removes all audio from the internal AudioClips list
function UnloadAllAudio() end

--Reads a file at a path and returns the contents of it
---@param path string
---@return string
function ReadFile(path) end

--Creates a directory at a path
---@param name string
---@param path string
function CreateDirectory(name, path) end

--Creates a file at a path
---@param name string
---@param path string
function CreateFile(name, path) end

--Writes to a file at a path
---@param path string
---@param text string
function WriteToFile(path, text) end

--Checks if a file exists at a path
---@param path string
---@return boolean
function FileExists(path) end

--Checks if a directory exists at a path
---@param path string
---@return boolean
function DirectoryExists(path) end

---Basic callback function. It is called whenever a certain callback happens (ex. death, weapon)
---@param name string
---@param parameters any[]
function Callback(name, parameters) end

---Called when a scene is loaded.
---@param name string
function OnSceneLoaded(name) end

---Runs every frame.
---@param deltaTime number
function OnUpdate(deltaTime) end

---@type string
---The gameObject name of the player (READONLY).
player = ""

---@type number
---The time since the last frame (READONLY).
deltaTime = 0

---@type number
---The rate at which time passes (READONLY).
timeScale = 1

--@type string
-- The persistent data path (READONLY).
persistentDataPath = ""