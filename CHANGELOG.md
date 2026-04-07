# Changelog

All notable changes to this project will be documented in this file.

This project is still in early prototype development, so entries are grouped by milestone rather than formal releases.

## [0.1.0] - 2026-04-07

### Added
- Created the initial Godot project structure and Git-based repository setup.
- Added a first-person player controller using `CharacterBody3D`.
- Added mouse look, walking, sprinting, jumping, gravity, and captured-mouse gameplay flow.
- Added a reusable `HealthComponent` for player, enemies, base objects, and future damageable actors.
- Added a hitscan weapon system with configurable fire rate, damage, range, and trigger mode.
- Added a viewmodel weapon scene attached to the player camera.
- Added target dummy scenes for early shooting and damage testing.
- Added a base core scene with health, damage handling, destroy state, and target point support.
- Added a basic enemy scene with navigation, target evaluation, melee attacks, damage/death flow, and base/player pressure behavior.
- Added groups-based targeting foundations using `players`, `enemies`, and `base_objective`.
- Added a wave manager that supports configurable wave count, intermissions, spawn timing, enemy tracking, and run completion.
- Added a prototype HUD for player health, base health, wave info, enemy counts, status messages, center messages, and restart hint.
- Added run-state flow for active, failed, and completed runs.
- Added scene reload restart flow using the `restart_run` input action.
- Added initial documentation under `docs/` for MVP vision and prototype direction.

### Changed
- Reworked the prototype level layout and expanded the test arena.
- Moved documentation into the `docs/` folder for cleaner project organization.
- Moved enemy spawning from manually placed scene instances to runtime spawning through the wave manager.
- Updated enemy collision from box-based collision to capsule-based collision for better navigation through tight spaces.
- Improved enemy retargeting so enemies can reevaluate player focus instead of staying locked on the base.
- Updated navigation setup to work with the current mix of level geometry and bake workflow.
- Aligned floor collision and visible geometry more closely for more reliable navigation and gameplay testing.
- Adjusted player and enemy tuning values during early gameplay iteration.

### Fixed
- Fixed enemies getting permanently locked onto the base instead of switching to nearby players.
- Fixed doorway traversal issues caused by box collision on enemies.
- Fixed several script warnings by renaming intentionally unused parameters and avoiding shadowed built-in names.

### Current Prototype State
- One playable prototype map with first-person movement and hitscan combat.
- One functional enemy type.
- One functional base objective.
- Runtime wave spawning and automatic wave progression.
- Basic fail/win flow and restart support.
- Minimal HUD and combat readability foundation.
- No classes, abilities, loot, progression, multiplayer, or upgrade draft systems yet.
