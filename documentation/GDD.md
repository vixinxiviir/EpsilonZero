# Epsilon Zero — Game Design Document

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Core Design Philosophy](#2-core-design-philosophy)
3. [Narrative Structure](#3-narrative-structure)
4. [The Four Runs](#4-the-four-runs)
5. [World Structure & Mathematical Progression](#5-world-structure--mathematical-progression)
6. [The Epsilon Notation System](#6-the-epsilon-notation-system)
7. [Puzzle Design](#7-puzzle-design)
8. [Development Workflow & Asset Pipeline](#8-development-workflow--asset-pipeline)
9. [Technical Reference](#9-technical-reference)

---

## 1. Project Overview

**Epsilon Zero** is a first-person 3D puzzle game where players learn to decode and solve mathematical equations using a custom notation system invented by the player character across previous iterations of the world. The game focuses on making players actually *do* math by having equations describe observable physical phenomena, rather than acting as abstract locks.

**Engine:** Godot 4.6
**Tools:** Blender 5.0.1, Windows
**Target Playtime:** ~8 hours per run
**Reference Aesthetic:** The Witness — quasi-realism with simple geometry and excellent lighting

---

## 2. Core Design Philosophy

- **Math as empowering tool, not gatekeeping.** Understanding should feel like gaining power and certainty.
- **Solving equations must feel easier than brute forcing.** Environmental constraints should make math the path of least resistance, never one option among many.
- **Equations describe something that already exists in the world.** Puzzles are not locks that equations open — the physical system *is* the equation made real.
- **Build intuition through physical phenomena,** not abstract symbol manipulation.
- **Trust players to derive meaning** (Witness-style) rather than explicit exposition.

### Key Puzzle Properties

- **Observable but unpredictable:** Players can see systems but cannot fully predict them without math.
- **Precision requirements:** Close enough is never good enough — exact values matter.
- **Multi-step chains:** One solution feeds into the next, making brute force exponentially harder.
- **Hidden information:** Math reveals what observation alone cannot.
- **Natural restrictions:** Environmental constraints that incentivize solving (e.g. needing to look away to calibrate) rather than punishing the player.

---

## 3. Narrative Structure

### The Loop

The player *is* ε (epsilon) — the person who left all the notes. Each run is an iteration of epsilon attempting to build a perfect world. The notation system was invented by epsilon across previous attempts, which is why it feels learnable: the player is not decoding an alien language, they are rediscovering their own invention.

- The **epsilon tattoo** (a simple ε on the back of the player's hand) is visible during all interactions throughout the game.
- Notes are signed **"— ε"** and show a progression across runs: frustrated → confident → concerned → resolved.
- Failed attempts are visible in the environment: scorch marks, broken objects, notes referencing "beginning again."
- Subtle hints build across all four runs to the revelation in Run 4.

### Environmental Storytelling

- Notes throughout show previous attempts and recalculations.
- World state literally builds layer by layer with each run (Genesis parallel — see Section 4).
- The handwritten notation font implies the player scrawled these symbols on the walls themselves in past iterations.
- Note handwriting may evolve across runs — hurried and uncertain in Run 1, assured and deliberate in Run 4 — telling epsilon's story through penmanship alone. *(Polish phase.)*

### The Message in a Bottle (Run 4 Only)

- A personal developer message about struggling with and then loving math.
- What the game hoped the player would feel.
- Revelation: *"Look at your hands. You've always known the way. — ε"*
- Forward-looking: *"What will you build next?"*
- Tone: Reflective and intimate, not preachy. An earned reward for the ~1% who reach mastery.
- Final moment: Camera shifts to third-person, showing the player holding the bottle with the epsilon tattoo visible on their hand.

---

## 4. The Four Runs

Run 1 must be completed before any others. After completing Run 1, players may select any subsequent run from the main menu. Only Run 4 completion unlocks the true ending.

### Run 1 — Discovery
- **Difficulty:** No penalties, unlimited attempts.
- **World State:** Barren stone world — mountains, valleys, structures, but no life.
- **Visuals:** Grays, browns, dim pre-dawn lighting, silence.
- **Purpose:** Learn the notation system, understand mechanics.
- **Ending:** Incomplete world, mysterious/philosophical tone. Final note signed "— ε."

### Run 2 — Precision
- **Difficulty:** 3–5 mistakes allowed per region; restart region on failure.
- **World State:** Vegetation appears — grass, trees, vines, flowers.
- **Visuals:** Greens join the palette, golden hour lighting, rustling leaves.
- **Purpose:** Test genuine understanding versus lucky guessing.

### Run 3 — Expertise
- **Difficulty:** Zero mistakes per region; one error restarts the region.
- **World State:** Animals appear — birds, deer, fish — but they flee from the player.
- **Visuals:** Full color, dynamic day/night cycle, birdsong and animal sounds.
- **Purpose:** Demonstrate mastery of concepts.

### Run 4 — Mastery (True Ending)
- **Difficulty:** One mistake allowed total; second mistake triggers a full restart.
- **World State:** Habitable — animals no longer flee, signs of habitation appear.
- **Visuals:** Warm, golden hour, peaceful sounds.
- **Purpose:** Ultimate mastery challenge and true ending reveal.

### Genesis Aesthetic Advantage

The primitive greybox aesthetic serves the narrative directly:
- Run 1: Geometric/primitive (stone blocks emerging from void) — this *is* the aesthetic, not a placeholder.
- Run 2: Same geometry + textures and vegetation.
- Run 3: Organic elements, softer edges.
- Run 4: Full polish, warm and inviting.

---

## 5. World Structure & Mathematical Progression

### Overview

The game is divided into **four worlds**, each representing a mathematical domain, traversed linearly in the style of Portal. Players cannot skip puzzles; story and lore are discovered along the way.

Worlds are divided into **four quarters**, each introducing or synthesizing one conceptual layer. Notation puzzles appear heavily in early quarters and taper off as the game progresses — by Calculus World, puzzles are primarily conceptual rather than symbolic.

### Target Puzzle Count

- **Total:** 50–80 distinct puzzle moments
- **Per world:** 12–20 puzzle moments
- **Per quarter:** 3–5 puzzles

### World Lengths (Target ~8 Hours Total)

| World | Share | Time | Notes |
|---|---|---|---|
| Arithmetic | ~35% | ~2.5–3 hrs | Heaviest tutorial load |
| Algebra | ~25% | ~2 hrs | |
| Geometry | ~25% | ~2 hrs | |
| Calculus | ~15% | ~1–1.5 hrs | Shorter but most intense |

Arithmetic World is front-loaded because it teaches both the notation system and the environmental puzzle grammar simultaneously. Calculus World is shorter but climactic.

### Pacing Rhythm

The rhythm within each world is: **think hard → breathe → think hard again.**

- Between puzzle rooms: ~30 seconds of open walking. Players explore small world changes, discover lore notes, and decompress.
- At the end of each world: a **formation event** — a large-scale world-state change the player witnesses in real time with camera control retained (Half-Life/Portal style, no cinematic cuts).

### The Four Formation Events

| World | Formation Event |
|---|---|
| Arithmetic | Light comes to the dark world |
| Algebra | Oceans appear |
| Geometry | Land forms |
| Calculus | Mountains, valleys, and terrain relief emerge |

These parallel the Genesis creation narrative and escalate in visual drama. The camera freedom during these moments is intentional: players may instinctively look down at their hands and see the epsilon tattoo at the most emotionally resonant moments in the game — unscripted and personal.

---

### Arithmetic World

**Quarter 1 — Addition & Subtraction**
**Quarter 2 — Multiplication & Division**
**Quarter 3 — Negative Numbers**
**Quarter 4 — Order of Operations** *(synthesis: no new operators, new rules about existing ones)*

### Algebra World
*(Quarters to be designed — solving for variables, proportional reasoning, coordinate geometry, exponents/logarithms)*

### Geometry World
*(Quarters to be designed — Pythagorean theorem, area/volume, trigonometry, spatial reasoning)*

> **Design note:** Geometry World has a wide scope. The transition from static geometric relationships (Geometry) to dynamic ones (Calculus) is the hardest pedagogical jump in the arc. Define where Geometry starts and what its ceiling is before designing Calculus World.

### Calculus World
*(Quarters to be designed — rates of change as derivatives, accumulation as integration)*

> **Design note:** Derivatives via observable rates of change (speed of a platform, slope of a ramp) are intuitive. Integration is harder to make physical — but accumulation (water filling a tank, distance traveled over time) maps well to the pneumatic tube puzzle style.

---

## 6. The Epsilon Notation System

### Design Principle

Symbols have **internal logic** that rewards close attention. Players who notice the logic get a foothold; players who don't must decode by observation and context — the same way a language is acquired through immersion. The notation is not a lookup table; it is a coherent language.

The notation was invented by epsilon across previous runs. It is rendered in a **handwritten/scrawled font** implying it was written on walls by the player in past iterations.

### Operators

| Concept | Symbol | Internal Logic |
|---|---|---|
| Addition | `<>` | Arrows pointing inward — bringing things together |
| Subtraction | `><` | Arrows pointing outward — pushing things apart |
| Multiplication | `□` (square) | Implies area — two-dimensional scaling |
| Division | `◇` with line through middle | Rotated square (same relationship as `><` to `<>`) with a visible split |
| Equality | `:` | Two equal dots — symmetry implies balance |

### Grouping Symbols

Half-brackets (`⌐` and `¬` style) replace parentheses. They look architectural rather than mathematical, forcing players to understand their role in the context of a whole equation rather than recognizing them individually. This makes order of operations a genuine decoding challenge.

### Variables (Greek Letters)

| Symbol | Meaning |
|---|---|
| χ (chi) | Time |
| λ (lambda) | Speed / velocity |
| α (alpha) | Primary unknown (replaces x) |
| β (beta) | Secondary unknown (replaces y) |

### Negative Numbers

Individual digits are rendered **upside down**. A negative 12 looks like an upside-down 12; each digit in the quantity is flipped. This keeps operators strictly operative and number properties strictly descriptive — two layers of information that remain visually separate, avoiding the ambiguity of standard notation (e.g. `3 >< ><2` versus `3 >< [flipped 2]`).

### Fractions

The `□` (multiplication/area) symbol doubles as the **vinculum** when equations are displayed vertically. Fractions are not new notation — they are the square operator displayed differently. The player's first encounter with a vertical fraction should be a deliberate puzzle moment where they realize the connection themselves.

---

## 7. Puzzle Design

### Two Puzzle Types

**Notation Puzzles:** The equation is the puzzle. Player decodes symbols and solves mathematically. Appear heavily in early quarters, taper off as the game progresses.

**Environmental Puzzles:** The equation is the key; the world is the lock. The intellectual work is *translation* — mapping abstract values to physical reality. Players should solve the math trivially; the challenge is the correspondence between equation and world.

### Difficulty Grammar

A consistent grammar applies to both puzzle types, so players intuitively understand what's being asked even in new contexts:

1. **Constrained answer** (multiple choice / Type 2 interface) — player recognizes rather than produces
2. **Free answer** (unconstrained / Type 1 or 3) — player commits to their hypothesis
3. **Complex multi-step** — player chains concepts together

### Interaction Types

**Type 1 — Physical Manipulation**
Player picks up and moves props in the world. Most intuitive, least abstract. Best for early puzzles where the equation-to-world correspondence must be obvious.
*Example: placing floor tiles to fill an area, building a bridge from planks and rails.*

**Type 2 — Constrained Interface**
Player interacts with a control mechanism with a limited option set (on/off switch, crank with set angles, discrete selector). The available positions *are* the answer set — the environmental equivalent of multiple choice.
*Example: gear system with a crank, platform speed selector with fixed increments.*

**Type 3 — Unconstrained Interface**
Player types a value or increments a counter freely. No environmental scaffolding. Player must arrive at a precise value independently and commit. Reserved for later puzzles.
*Example: pneumatic tube speed calibration.*

---

### Opening Puzzle Sequence (Arithmetic World, Quarter 1)

Designed to teach notation through immersion rather than instruction. The player decodes `<>` subconsciously — almost retroactively.

1. **Puzzle 1:** Player sees `2 <> 2 : ?` with numbered blocks 1–5 to submit. Multiple choice constrains the answer set — 4 is the only intuitive answer.
2. **Puzzle 2:** `4 <> 7 : ?` — free answer. Forces the player to commit to their hypothesis about `<>`. Confirms the addition reading.
3. **Puzzle 3:** `3 <> 5 <> 1 : ?` — chained addition, confirms understanding before any new concepts are introduced.
4. **Bridge Puzzle (transition):** Player must combine planks and rails to build a bridge of a required length. The equation is already solved and describes the physical result — no input required, just build and notice the correspondence. Teaches that equations describe physical reality. This is the transition from notation puzzles to environmental puzzles.
5. **Introduction of `><`:** Subtraction enters after addition is fully confirmed.

---

### Puzzle Ideas by Quarter

#### Quarter 1 — Addition & Subtraction

- **Bridge building:** Combine planks and rails (different unit lengths) to span a gap of a required total length. The equation is already solved; player builds to match it. *(Type 1, transition puzzle)*
- **Weight and counterweight:** Two platforms connected — adding objects to one raises the other. Subtraction enters naturally when removing weight rather than adding it. *(Type 1)*
- **Water and containers:** Fill a tank to a required level using jugs of known sizes. Subtraction via draining. *(Type 1 or 3)*
- **Path length:** A space where corridors have labeled lengths and the player must reach exactly a certain total distance. Wrong paths are too long or too short. *(Type 1 or 2)*

#### Quarter 2 — Multiplication & Division

> **Design principle for this quarter:** Players are given an equation and must figure out which props in the environment map to the inputs, then use that understanding to determine how many they need. The equation is trivially solvable; the challenge is translation.

- **Tiling:** A room with a gap in the floor. The equation describes total area; player selects from available tile sizes and fills the space. *(Type 1)*
- **Repeated groups:** A room with several identical crates, each containing the same quantity of objects. The equation describes the total. Player must recognize that `□` means "groups of" and arrange accordingly. *(Type 1)*
- **Formation/arrangement:** Arrange units into rows and columns. The equation describes formation dimensions; player physically places them. *(Type 1)*

#### Quarter 3 — Negative Numbers

- **Elevation puzzles:** Platforms above and below a reference point. A platform must reach a depth of [flipped 3] meters below ground. *(Type 2 or 3)*
- **Temperature or pressure systems** where values cross zero. *(Type 2 or 3)*

#### Quarter 4 — Order of Operations

- **Multi-step machine:** Operations happen in a sequence — does the grouping symbol change which lever fires first? *(Type 2)*

---

### Example Puzzle — Pneumatic Tube (Reference Design)

A platform moves into a wall and stops beyond view at an exit door. The player sees an equation describing the platform's motion and must calculate its velocity. To reach the platform via the pneumatic tube system, the player must calibrate the tube speed — but calibration requires looking away from the platform. This naturally incentivizes solving the equation rather than memorizing or guessing. *(Type 3)*

---

## 8. Development Workflow & Asset Pipeline

### Current Phase: Greybox / Blockout

Using primitives (cubes, planes, cylinders) to test gameplay and puzzle mechanics. Focus: does the puzzle work? Is spacing right? Can players navigate? Aesthetics are not a concern in this phase.

### Development Phases

**Phase 1 — Greybox (Current)**
- Primitives for puzzles (doors, platforms, movable objects, interaction points)
- Simple terrain heightmaps for ground (basic elevation from the start)
- Build 2–3 complete puzzle rooms to test mechanics
- Iterate until puzzles feel good

**Phase 2 — Refined Greybox**
- Lock down proper scale and proportions
- Add placeholder collision shapes matching final intent
- Test full puzzle chains and progression
- Lock "playable space" dimensions

**Phase 3 — Modular Assets**
- Replace primitives with modular pieces (wall tiles, floor tiles, etc.)
- Create asset library: wall sections (2m, 4m, corner, doorway), floor tiles (flat, sloped, stairs), puzzle-specific props
- These snap together like LEGO — geometric but more refined
- Collision stays mostly the same
- Lighting and materials begin to matter

**Phase 4 — Final Polish**
- Replace modular pieces with custom terrain/meshes where needed
- Add organic elements (rocks, vegetation for Run 2+, animals for Run 3+)
- Polish lighting, post-processing, details
- Custom meshes for hero areas (starting beach, final regions)

### Phase Transition Timing

- **Greybox → Modular:** When 3–5 complete puzzle rooms feel good to play
- **Modular → Polish:** When ALL puzzles are built and entering content lock (no more design changes)
- **Do not transition too early** — polishing before gameplay is locked is the most common and costly mistake

### Workflow Rules (Avoid Rework)

- **Consistent scale:** If a primitive cube is 2×2×2m, the final door should be ~2m wide.
- **Separate collision from visuals early:** Use `CollisionShape3D` separate from `MeshInstance3D`.
- **Use scenes/instancing:** Make each object its own scene to swap internals later without repositioning.
- **Name clearly:** `Wall_2m_Straight` not `Cube_017`.

### Terrain Handling

- Use Godot's `HeightMapShape3D` for collision early.
- Build height variation from the start (ramps, platforms at different elevations) — don't make everything flat.
- Build puzzle objects relative to terrain height.
- Polish terrain last, but establish some variation from the beginning.

### Asset Creation Notes

- All primitives created in Blender 5.0.1, exported as `.glb`
- Origins set to bottom-center or geometry center as appropriate
- Transforms applied before export (critical for correct Godot scaling)
- Collision handled via `-col` suffix for architectural pieces with holes/openings
- All pieces align to 2m grid in Godot with snap settings enabled (translate snap = 2m, rotation snap = 90°)

---

## 9. Technical Reference

### Available Primitive Assets (Greybox Phase)

All pieces use a 2m grid system with subtle beveled edges for The Witness-style aesthetic.

#### Architectural Primitives

| Asset | File | Dimensions | Notes |
|---|---|---|---|
| Floor Tile | `floor_tile_01.glb` | 2×2m, 0.1m thick | Base grid unit |
| Wall Section | `wall_section_01.glb` | 2m wide × 3m tall × 0.2m thick | Modular wall panel |
| Doorway | `doorway_01.glb` | 2m wide × 3m tall, ~1.5–2m opening | Uses `-col` suffix for collision with opening |

#### Elevation Primitives

| Asset | File | Dimensions | Notes |
|---|---|---|---|
| Step (Small) | `step_small_01.glb` | 2×2m, 0.2m tall | Auto-step not yet implemented — requires small jump (polish task) |
| Platform | `step_platform_01.glb` | 2×2m, 0.5m tall | Jump-height platform for puzzle mechanics |
| Ramp | `ramp_01.glb` | 2m wide, 0.5m rise over 2m | ~14° slope, gentle and walkable |

#### Puzzle / Interaction Primitives

| Asset | File | Dimensions | Notes |
|---|---|---|---|
| Pedestal | `pedestal_01.glb` | 0.5×0.5m footprint, 1m tall | Slightly wider top cap. For interactive objects. |
| Panel Mount | `panel_mount_01.glb` | 1m wide × 1.5m tall | Origin at bottom-center. For equations and puzzle interfaces. Comfortable at 0.5–2m off ground. |

#### Known Polish Items

- Ramp alignment with floor tiles slightly off
- Step auto-walk behavior not yet implemented (`CharacterBody3D` limitation)
- All pieces currently basic geometry — textures/materials added in Phase 3

### Engine & Input

- **Engine:** Godot 4.6
- **Player controller:** `CharacterBody3D`, first-person, mouse look, raycast interaction
- **Input:** WASD movement, mouse look, E to interact, Shift to sprint
- **World state:** Persists and builds across runs (terrain → vegetation → animals → habitation)

### Code Style

- **Variables:** camelCase — `myVarName`
- **Functions/Methods:** snake_case — `my_func_name`

### AI Assistance Rules

- Do not supply full code solutions unless the prompt contains the code word **"epistemological"**
- Individual lines or small snippets to demonstrate a function or method are permitted
- Godot node structure, settings, and configuration instructions may be provided freely
