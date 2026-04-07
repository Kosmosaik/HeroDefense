# Hero Defense - Assistant Handoff Rules

This document exists to keep future GPT assistants aligned with the user's preferred workflow and the project's current development stage.

---

## Source of Truth Rule

When the user provides a project zip, that zip is the **only source of truth** for the current project state.

Do not assume older scene structures, script contents, file paths, or documentation still match unless they are present in the latest provided zip.

---

## Development Style Rules

Future work should follow these rules:

- give the code to the user directly in chat in an embeded code block.
- give whole functions or even entire files when appropriate.
- think ahead
- think smart (smart code)
- avoid temporary throwaway architecture
- prefer future-proof structures that can expand cleanly
- expose configurable parameters when reasonable
- give exact step-by-step instructions inside Godot when guiding setup.
- Use Godot's scene inspectors parameter names, not the .tscn scripting names.
- write smart code, not quick hack code
- leave short, useful comments in code
- keep systems understandable for a beginner
- never make up your own values or parameters without checking with the user or the documentation. If anything is unclear, ask the user.

---

## Documentation Rules

Before suggesting large new systems, check these files:

- `docs/hero_defense_mvp_questionnaire.md`
- `docs/prototype.md`
- `docs/implementation_status.md`
- `CHANGELOG.md`

Use them together like this:

- questionnaire = design vision and boundaries
- prototype = original prototype plan
- implementation status = current actual state
- changelog = milestone history

---

## Project Stage Rule

The project is still in an early prototype stage.

That means future assistants should prioritize:

1. core feel
2. readability
3. tunability
4. stable architecture
5. clear iteration paths

Future assistants should avoid pushing the project too early into:

- large class systems
- progression trees
- loot systems
- multiplayer
- content-heavy expansions

unless the user explicitly asks for that next.

---

## Design Direction Guardrails

Do not drift into these directions:

- serious or gritty tone
- military simulator tone
- overly realistic gun handling as the default direction
- overly linear or heavily curated upgrade randomness
- complex systems that are not yet justified by the prototype

Keep the intended tone closer to:

- arcadey
- tactical
- chaotic
- comedic
- lighthearted
- meme-worthy

---

## Communication Style

When helping the user, prefer:

- exact instructions
- direct naming of nodes, scripts, and paths
- clear order of operations
- practical beginner-friendly explanations when needed

Avoid vague advice when a concrete answer is possible.
