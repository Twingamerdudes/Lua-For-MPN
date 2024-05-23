# Lua For MPN
## Introduction
Lua for M:PN allows you to use lua to control Madness: Project Nexus.

This is the successor to Lua for NEM and will have support for new features along with old features from Lua for NEM.

List of prominent features:
* Support for M:PN workshop
* Reworked UI system for building UI using Swain's built-in M:PN UI tools.
* Steam cloud support
* Post-processing support
* Basic AI manipulation
* Basic statcard editing at runtime
* Squad combatant control
* Audio support w/ FMOD
* Audio support w/o FMOD
* And many, many other features for you to use.

# Setup
Get the DLL files from the releases section. Then drag and drop them into (M:PN's directory)/Madness Project Nexus_Data/Managed folder.

That's it, it is that simple.

# Making your first Lua for M:PN mod
This is a basic tutorial on how to make your first M:PN mod.

Making mods with Lua is easy using Lua for M:PN.

Navigate to your mods directory (if you don't have a mod setup, follow [Swain's overview to making mods](https://docs.google.com/document/d/1f_RbQGE45CY8no6mFuVGTaOTF7XnaK7yq5tJXty_JSA/)), then make a file called main.lua (it can be anything that ends with .lua, but it's nice to follow a format).

Inside of this lua follow, paste in the following code:
```lua
function OnSceneLoaded(scenename)
  Notice(scenename.." loaded!!!")
end

function OnUpdate()

end
```

To test out this code, boot up the game and load into a scene that has a combatant in it (The notice function does not work within the main menu)

This code outputs the loaded scene's name to the game's notice menu. Not too much.

But as you learn Lua for M:PN, you will be able to do more complex things.
