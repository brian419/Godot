[Current State of the Second Godot Game Development](SecondGame/CurrentState5:08:2024.gif)

# Godot Game Development Projects

## Overview 

This will be a repository documenting my learning for making games within Godot. 

# Programmer's Personal Notes 
I am accessing Pixilart.com to generate my pixel asset sprites for the time being. Game 2 implementation needs: animation frames for player knight jump and enemy (all their motions), health bar functionality (need to implement one that stays on one part of the screen?), weapon for player (need to figure out how to attach it to the player? update weapon sprite as well, the logic for collision already written and works for placed weapon on game scene), better player movement overall. 

What I'm using in the terminal command:
-Adding multiple png frames into one png frame for animation import) "convert 1.png 2.png 3.png -append result.png" and it puts the frames in one image horizontally. 


-Converting Screenrecord video (.mov) into (.gif) using the following command line) ffmpeg -i "NameOfVideo.mov" -i palette.png -lavfi "fps=15,scale=640:-1:flags=lanczos [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=5" -y VideoOutputName.gif



## Project 2 Overview

This is a Godot game project focusing on an open-world 2D environment with a dynamic spawning system for enemies. The player will explore various scenes including shops, dungeons, and interact with different elements like castles, portals, and special blocks. The game incorporates RPG elements such as leveling up, earning skill points, purchasing weapons and potions, and facing diverse enemy types.

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
