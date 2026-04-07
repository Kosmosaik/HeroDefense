# Hero Defense - Prototype Plan

## Purpose

The purpose of this prototype is to prove the **core gameplay feel** before building classes, abilities, progression, loot systems, advanced base systems, or multiplayer.

This prototype should answer these questions:

- Is movement fun?
- Is shooting fun?
- Does hitting enemies feel good?
- Does taking damage and dying feel readable and satisfying?
- Can a basic enemy create pressure?
- Does defending a base against waves feel promising?

If the answer to those questions is **yes**, then the project has a strong foundation.

---

## Prototype Goal

Build the **smallest playable version** of the game that proves:

- first-person movement
- shooting and hit detection
- enemy damage and death
- player damage and death
- simple enemy AI
- base health and defense objective
- wave spawning and completion flow

---

## Prototype Scope

### Include in the prototype

- 1 first-person player controller
- 1 placeholder weapon
- 1 placeholder enemy
- 1 placeholder base/core
- 1 simple test map made with CSG or primitive meshes
- 1 simple wave manager
- basic UI for health and wave info
- hit feedback and death feedback
- restart flow

### Do **not** include yet

- classes
- abilities
- gadgets
- loot drops
- upgrade drafting
- buildable defenses
- base upgrades
- multiple enemy types
- boss
- meta progression
- menus or polish beyond testing needs
- multiplayer

---

## Success Criteria

The prototype is successful if:

1. Moving around feels responsive and enjoyable.
2. Shooting enemies feels readable and satisfying.
3. Enemies clearly move toward the objective and create pressure.
4. The player can understand when they are winning or losing.
5. A short wave-based survival loop feels fun even with placeholders.
6. The prototype is stable enough to iterate on.

---

## Core Pillars to Prove First

### 1. Movement

The player must feel good to control.

Focus on:

- mouse look
- walking
- sprinting
- jumping
- gravity
- collision feel

Optional later:

- crouch
- slide
- dash

### 2. Shooting

The gun must feel responsive.

Focus on:

- instant click response
- hitscan shot
- muzzle flash placeholder
- hit marker
- damage application
- firing cooldown

### 3. Damage and Death

Combat must be readable.

Focus on:

- enemy takes damage
- enemy dies clearly
- player takes damage clearly
- player death state
- base takes damage clearly

### 4. Enemy Pressure

The enemy must be simple but functional.

Focus on:

- move toward target
- detect when close enough to attack
- damage player or base
- die when health reaches zero

### 5. Wave Flow

There must be a basic combat loop.

Focus on:

1. start wave
2. spawn enemies
3. track alive enemies
4. end wave when all are dead
5. short pause
6. start next wave automatically

---

## Recommended Implementation Order

### Phase 1 - Project Setup

#### Goal

Create a clean starting structure.

#### Tasks

- create the Godot project
- set up folders
- create a test scene
- create a global singleton later only if needed
- set up input actions

#### Input Actions

- `move_forward`
- `move_backward`
- `move_left`
- `move_right`
- `jump`
- `sprint`
- `shoot`
- `interact`  
  Reserved for later use.
- `pause`  
  Optional.

#### Deliverable

A project ready for first gameplay code.

---

### Phase 2 - Player Controller

#### Goal

Get the player moving in first person.

#### Tasks

- create the player scene
- add a camera
- implement mouse look
- implement movement
- implement jump
- implement sprint
- add gravity
- lock and capture the mouse
- add a simple collision capsule

#### Notes

Keep it simple and responsive.  
Do not overbuild advanced movement yet.

#### Deliverable

The player can move around the prototype level smoothly.

---

### Phase 3 - Prototype Map

#### Goal

Create a simple combat test area.

#### Map Idea

A small linear arena with:

- one player spawn area
- one base/core behind the player
- one open lane in front
- one enemy spawn area in the distance
- some basic cover, rocks, and raised positions

#### Tasks

- build the map with CSG or primitive meshes
- add floor, walls, ramps, and a few height differences
- make sure the space is walkable for enemies
- add the base location
- add enemy spawn points

#### Deliverable

A simple playable test arena.

---

### Phase 4 - Basic Weapon

#### Goal

Make the player able to shoot.

#### Tasks

- add a weapon node to the player
- create a simple placeholder weapon model
- implement hitscan shooting
- add fire cooldown
- add a damage value
- use a raycast or physics query for hit detection
- add a basic muzzle flash placeholder
- add a basic hit marker or debug feedback

#### Keep It Simple

Do **not** add yet:

- reload
- ammo
- recoil system
- multiple weapons

#### Deliverable

The player can shoot and register hits.

---

### Phase 5 - Health System

#### Goal

Create a reusable damage and health flow.

#### Tasks

- create a simple health component or base health script pattern
- add max health
- add current health
- add `take_damage()`
- add death handling
- optionally leave room for healing later

#### Apply To

- player
- enemy
- base

#### Deliverable

All core damageable entities can lose health and die or be destroyed.

---

### Phase 6 - Basic Enemy

#### Goal

Create one functioning enemy.

#### Enemy Prototype Behavior

- spawn
- move toward player or base
- if player is near, attack player
- otherwise continue toward base
- if close to base, attack base
- die when health reaches zero

#### Tasks

- create the enemy scene
- add a placeholder mesh
- add a collider
- add movement logic
- add health
- add death logic
- add a simple attack timer
- add damage to target

#### AI Notes

Keep AI intentionally basic.  
This is only to prove the loop.

#### Deliverable

One enemy type that can pressure both the player and the base.

---

### Phase 7 - Base/Core

#### Goal

Add the defense objective.

#### Tasks

- create the base/core scene
- add health
- add simple visible feedback when damaged
- add a destroyed state
- connect destruction to game over logic

#### Deliverable

A defendable object that can be attacked and destroyed.

---

### Phase 8 - Enemy Targeting Logic

#### Goal

Make combat feel like defense, not just deathmatch.

#### Recommended Behavior

Enemy priority:

1. attack player if the player is close or blocking the path
2. otherwise move toward the base
3. attack the base when in range

#### Tasks

- add simple target evaluation
- switch between move and attack states
- prevent jittery target switching
- add attack cooldown

#### Deliverable

Enemies behave like base attackers, not random wanderers.

---

### Phase 9 - Wave System

#### Goal

Create the actual survival loop.

#### Basic Wave Flow

1. wait a short prep delay
2. spawn wave enemies
3. track living enemies
4. end wave when all are dead
5. show a short break
6. start next wave automatically

#### Tasks

- create a wave manager
- define wave number
- define number of enemies per wave
- spawn enemies at intervals or all at once
- track active enemies
- detect wave completion
- start next wave after a timer

#### Keep It Simple

Do **not** add upgrade choices yet.

#### Deliverable

The player can survive multiple waves in sequence.

---

### Phase 10 - Basic UI

#### Goal

Make the prototype readable.

#### UI To Include

- player health
- base health
- current wave
- enemies remaining
- game over text
- wave cleared text

#### Notes

The UI can be ugly as long as it is readable.

#### Deliverable

A minimal HUD that supports playtesting.

---

### Phase 11 - Feedback Pass

#### Goal

Improve feel without overcomplicating systems.

#### Additions

- hit marker
- damage flash on player
- enemy hurt flash
- enemy death effect
- simple placeholder sounds
- simple camera punch or light screen feedback on firing
- wave start and wave end text

#### Deliverable

Combat feels more alive and readable.

---

### Phase 12 - Playtest and Tuning

#### Goal

Find out if the game loop is actually fun.

#### Test Questions

- Does movement feel good?
- Is the weapon satisfying to use?
- Are enemies too slow or too fast?
- Is the base too easy or too hard to defend?
- Does one wave naturally make you want to play the next?
- Does the arena support the intended defensive fantasy?

#### Tune These First

- player movement speed
- jump height
- enemy movement speed
- enemy damage
- player damage
- base health
- wave size
- spawn timing

#### Deliverable

A tuned prototype with a clear direction.

---

## First Technical Architecture

### Suggested Scenes

- `Main.tscn`
- `Player.tscn`
- `Weapon_Placeholder.tscn`
- `Enemy_Basic.tscn`
- `BaseCore.tscn`
- `HUD.tscn`

### Suggested Scripts

- `player_controller.gd`
- `weapon_hitscan.gd`
- `health.gd`
- `enemy_basic.gd`
- `base_core.gd`
- `wave_manager.gd`
- `hud.gd`

### Suggested Folder Structure

```text
res://
  scenes/
    main/
    player/
    enemies/
    weapons/
    ui/
    world/
  scripts/
    player/
    enemies/
    weapons/
    systems/
    ui/
  art/
    prototype/
  audio/
    prototype/
```

---

## Prototype Milestones

### Milestone 1 - Movement Test

The player can run around in first person.

### Milestone 2 - Shooting Test

The player can shoot targets and register hits.

### Milestone 3 - Combat Test

An enemy can move, take damage, attack, and die.

### Milestone 4 - Defense Test

An enemy can attack the base and cause failure.

### Milestone 5 - Wave Test

Multiple waves can run from start to finish.

### Milestone 6 - Fun Test

The combat loop feels promising enough to expand.

---

## What To Evaluate Before Expanding Further

Before adding classes, abilities, loot, or upgrades, answer these:

1. Is the movement fun enough to build around?
2. Is the shooting satisfying enough to repeat for many waves?
3. Does the enemy create enough threat?
4. Does defending the base feel different from just surviving personally?
5. Is the wave loop enjoyable even without progression systems?

If the answers are not strong enough, fix the foundation first.

---

## After the Prototype Works

Only after the prototype is fun should the next layer begin.

### Recommended Next Layer

1. add a second enemy type
2. improve enemy targeting and behavior
3. add a second weapon
4. add class structure
5. add one simple ability per class
6. add death and revive flow
7. add upgrade phase between waves
8. add a basic resource economy
9. add buildable defenses
10. begin multiplayer prototype

---

## Explicit Prototype Boundaries

To avoid overbuilding too early:

- do not start with multiplayer
- do not start with class kits
- do not start with loot systems
- do not start with persistent progression
- do not start with boss design
- do not start with advanced AI architecture
- do not optimize too early
- do not spend too much time on menus or polish

The job of the prototype is to prove the **combat-defense loop**, not the whole game.

---

## Final Summary

The prototype should focus on one core question:

**Can one player in first person move, shoot, kill enemies, defend a base, and survive waves in a way that already feels promising?**

If yes, the project can expand.  
If no, fix that before anything else.