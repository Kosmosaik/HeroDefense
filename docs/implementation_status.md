# Hero Defense - Implementation Status

This document describes the **current project state** so a new assistant or developer can understand what is already built, what is intentionally deferred, and what the recommended next steps are.

This file is meant to complement:

- `docs/hero_defense_mvp_questionnaire.md` for the locked design vision
- `docs/prototype.md` for the original prototype plan
- `CHANGELOG.md` for milestone history

---

## Current State Summary

The project is currently in the **playable core-combat prototype** stage.

The prototype already proves these fundamentals:

- first-person movement
- hitscan shooting
- reusable health and damage flow
- one enemy type with pathfinding and melee attack behavior
- a defendable base object
- runtime enemy wave spawning
- automatic wave progression
- fail/win state flow
- restart flow
- a minimal HUD

The project is **not** yet in the class/ability/build progression phase.

---

## What Is Implemented

### Core Player
- `Player.tscn`
- `player_controller.gd`

Implemented:
- mouse look
- movement
- sprint
- jump
- gravity
- death state handling
- weapon ownership and input handoff
- player registered in the `players` group

### Combat
- `WeaponHitscan.tscn`
- `weapon_hitscan.gd`
- `HealthComponent`

Implemented:
- center-screen hitscan firing
- configurable fire rate
- configurable damage
- configurable max range
- trigger mode support
- reusable `take_damage()` flow

### Enemy
- `EnemyBasic.tscn`
- `enemy_basic.gd`

Implemented:
- `NavigationAgent3D` path following
- base-priority behavior
- player retargeting within detection range
- melee attack behavior
- health, damage, death, and despawn flow
- enemy registration through the `enemies` group

### Base Objective
- `BaseCore.tscn`
- `base_core.gd`

Implemented:
- reusable health integration
- damage feedback
- destroyed state
- target point for enemies
- group registration through `base_objective`

### Wave Flow
- `wave_manager.gd`
- `main_game.gd`

Implemented:
- delayed run start
- configurable wave count
- configurable enemy count scaling
- configurable spawn interval
- intermission phase
- alive enemy tracking
- wave clear detection
- run complete state
- run failed state on base destruction
- scene reload restart

### HUD
- `HUD.tscn`
- `prototype_hud.gd`

Implemented:
- player health display
- base health display
- wave number display
- alive/spawn-remaining enemy display
- status text
- center message text
- restart hint text

### Test Content
- `TargetDummy.tscn`
- prototype level geometry in `Main.tscn`
- enemy spawn markers in `Main.tscn`

---

## What Is Intentionally Not Implemented Yet

These systems are intentionally deferred and should not be pulled into the prototype too early:

- class system
- class abilities
- gadgets
- weapon inventory expansion beyond the current starter setup
- ammo/reload economy
- loot drops
- upgrade drafting between waves
- buildable defenses
- base upgrade system
- multiple enemy archetypes
- bosses
- revive system
- persistent profile progression
- multiplayer
- menu flow beyond restart

---

## Recommended Next Steps

The next step should be a **feedback/readability pass**, not a major expansion system.

Recommended order:

1. Add a small crosshair or center dot
2. Add a hit marker on confirmed hit
3. Add player damage flash / screen feedback
4. Improve base damage readability
5. Improve wave start / wave cleared message timing
6. Tune movement, enemy speed, enemy damage, base durability, and wave pacing

After that, the next major gameplay step should be:

7. Add a second enemy type with clearly different pressure behavior

Only after the combat loop feels strong should the project move toward:

- class structure
- abilities
- build systems
- resource economy
- upgrade choices between waves

---

## Architecture Notes

### Current Core Scene Flow
- `Main.tscn` is the playable prototype root
- `main_game.gd` is responsible for top-level run flow
- `WaveManager` owns spawn pacing and wave lifecycle
- `Player` owns movement and weapon input
- `WeaponHitscan` owns shot execution
- `HealthComponent` is shared across damageable actors

### Current Design Direction
The prototype should stay focused on proving:

- movement feel
- shooting feel
- enemy pressure
- base-defense tension
- wave-to-wave fun

The project should **not drift** into generic mil-sim realism, gritty tone, or overly curated linear progression.

Tone direction remains:
- arcadey
- tactical
- chaotic
- comedic/lighthearted

---

## Known Prototype Limitations

These are not bugs unless they block iteration:

- only one enemy type exists
- enemy combat is melee-only
- combat feedback is still minimal
- the HUD is functional but not polished
- the level is still prototype geometry
- the weapon has no crosshair yet
- there is no wave reward or inter-wave upgrade logic yet

---

## Handoff Note

A new assistant should treat the current project state as:

**playable prototype foundation completed, first polish/tuning phase next**

That means the assistant should prefer:
- quality/readability improvements
- safer architectural additions
- configurable systems
- clean extension points

over large new feature branches.
