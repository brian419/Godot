[Current State of the Second Godot Game Development 5/09/2024](SecondGame/Status5:09:2024.gif)
[Outdated State of the Second Godot Game Development 5/08/2024](SecondGame/CurrentState5:08:2024.gif)

# Godot Game Development Projects

## Overview 

This will be a repository documenting my learning for making games within Godot. 

# Programmer's Personal Notes 
Game 2 implementation needs?
- More finalized animation frames and asset pngs for all assets used
- Weapon functionality (stuck to the player, figure out how to update the player's animation based on if the user presses the hotbar slot for weapon (slot 1 for now)
- Figure out the player movement, and make it work well. (Will this be gravity based or no gravity? or gravity on certain event actions?
- Figure out enemy weapon attack (if projectile, how do i show that well on the game screen?)

I am accessing Pixilart.com to generate my pixel asset sprites for the time being. 

What I'm using in the terminal command:::

-when I want to put multiple pngs into one .png file to use for animation frames use the following line: 
convert Frame1.png Frame2.png Frame3.png -append result.png

-use following line to obtain a palette.png from my video .mov file:
ffmpeg -i "file:/Users/brianson/Desktop/CurrentState5:09:2024.mov" -vf "fps=15,scale=640:-1:flags=lanczos,palettegen" -y palette.png


-use following line to compile .gif from the .mov file using the palette.png:
ffmpeg -i "file:/Users/brianson/Desktop/CurrentState5:09:2024.mov" -i palette.png -lavfi "fps=15,scale=640:-1:flags=lanczos [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=5" -y output.gif


## Project 2 Overview

This is a Godot game project focusing on an open-world 2D environment with enemies tracking towards the player upon the game's initialization. The player has to explore various scenes including shops, dungeons, and other specialized elements like castles, portals, and such in order to obtain items, potions, perks to help fight against enemies. The game incorporates RPG elements such as leveling up, earning skill points, purchasing weapons and potions, and facing diverse enemy types.

## Current Idea

### Gameplay Features

- **Open World Exploration:** Navigate freely through an infinite procedural world.
- **Dynamic Enemy Spawning:** Enemies spawn and head towards the player from all directions.
- **Interactive Elements:** Interact with castles, portals, and special blocks to enter new scenes.
- **RPG Elements:** Level up by fighting mobs, earn skill points for perks, purchase weapons and potions with gold.
- **Attack Options:** Various attack ideas for the player to use against enemies.
- **Potion Varieties:** Health potion, jump potion, and more for strategic advantages.
- **Weapon and Armor Variety:** Different weapons and armor to enhance gameplay.
- **Skill Point Perks:** Upgrade health, gold acquisition, damage types (melee, range, mage), and special perks like slowing down enemies.
- **Enemy Variety:** Slow, fast, archers, mages, flying, and minibosses with unique abilities.
- **AFK Mechanic:** Players can AFK in a special building to gain XP and skill points over time.

### Storyline

The game's storyline involves the player discovering an unknown world filled with constant enemies. As they progress, they uncover dungeons, hints of past adventurers, and ultimately confront angry minibosses who claim the player doesn't belong. The main storyline revolves around the player's journey to uncover the truth behind their presence in this hostile world.

## Why Play?

- **Engaging Gameplay:** Dynamic enemy encounters and RPG progression offer a challenging and rewarding experience.
- **Exploration:** Discover new scenes, dungeons, and secrets in an open-world setting.
- **Storyline:** Uncover the mystery of the world and the player's role within it through engaging narrative elements.
- **Strategic Depth:** Choose from various attack options, potions, weapons, and armor to tailor gameplay to your style.
- **Progression:** Level up, earn skill points, and unlock perks to become stronger and face tougher challenges.
- **Unique AFK Mechanic:** Gain rewards even while away from the game, adding a strategic element to progression.

## Future Plans

In future updates, I plan to compare and contrast this Godot version with the original HTML CANVAS version of the game to highlight the strengths and improvements of each platform. Stay tuned for more updates and enhancements to the gameplay experience.
