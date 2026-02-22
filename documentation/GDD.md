Github repo: https://github.com/vixinxiviir/EpsilonZero


I am making a 3D game in Godot 4.6. Refer to the end for a summary of the background.

Do not supply full code solutions to problems I'm facing unless I included the code word "epistemological" in the prompt. You can give individual lines or small snippets to demonstrate a function or method, but don't give me the answer, I want to build this as much as possible, using AI as a way to learn game development, not shortcut. You are allowed to provide Godot Node structure/settings and Godot settings changes and instructions, since I have to do those myself. 

Give all code names with camel Case (myVarName) for variables and snake case (my_func_name) for functions/methods

I am on Windows, Godot 4.6, and Blender 5.0.1.

The model aesthetic I want is similar to The Witness--quasi realism with simple geometry, but with very good lighting to make things look good.

The following is a game summary made in a brainstorming session:

Epsilon Zero - Game Design Summary
Core Concept
A first-person 3D puzzle game where players learn to decode and solve mathematical equations using a custom notation system. The game focuses on making players actually DO math by having equations describe observable physical phenomena in the world, rather than just acting as abstract locks.
Custom Math Notation

Example: 2 <> 2 : 4 instead of 2 + 2 = 4
Uses custom symbols and possibly Greek letters
Players discover what symbols mean through context and scattered notes
Progression: basic arithmetic → patterns/functions → rates of change → integration concepts (potentially rudimentary calculus by endgame)

Core Design Philosophy

Math as empowering tool, not gatekeeping
Solving equations should feel EASIER than brute forcing
Equations describe physical systems players can observe
Focus on building intuition through physical phenomena rather than abstract symbol manipulation
Make understanding feel like gaining power and certainty

Key Puzzle Design Principles

Observable but unpredictable: Players can see systems but can't fully predict without math
Precision requirements: Close enough isn't good enough - exact values matter
Multi-step chains: One solution feeds into the next, making brute force exponentially harder
Hidden information: Math reveals what observation alone cannot
Natural restrictions: Environmental constraints (like needing to look away to calibrate) that aren't punishing, just logical

Example Puzzle (Pneumatic Tube)
Platform moves into a wall, stops beyond view at exit door. Player sees equation describing motion, must calculate velocity. To use pneumatic tube system to reach platform, player must calibrate the tube speed - but calibration requires looking away from platform. This naturally incentivizes solving the equation rather than memorizing/guessing.
Puzzle Type Ideas

Cipher Journal/Translation Guide - Scattered pages reveal symbol meanings
Environmental Number Puzzles - Incomplete equations on doors, objects in room provide numbers
Pattern-Based Navigation - Floor tiles with traps, equations describe safe paths
Rotating/Movable Blocks - Arrange blocks to complete equations on walls
Scale/Balance Puzzles - Physical scales with numbered objects
Observable Systems - Watch platforms/projectiles move, equations describe their motion, predict future states

Progression: Four Runs (Genesis-Themed)
Run 1: Discovery

Difficulty: No penalties, unlimited attempts
World State: Barren stone world - mountains, valleys, structures but no life
Visuals: Grays, browns, dim pre-dawn lighting, silence
Purpose: Learn the notation system, understand mechanics
Ending: Incomplete world, mysterious/philosophical tone
Final note signed: "— ε"
Aesthetic: Stone, raw materials, low, dull lighting

Run 2: Precision

Difficulty: Limited mistakes per region (3-5), restart region on failure
World State: Vegetation appears - grass, trees, vines, flowers, some lighter lighting
Visuals: Greens join the palette, golden hour lighting, rustling leaves
Purpose: Test understanding vs. lucky guessing

Run 3: Expertise

Difficulty: Zero mistakes per region, one error = restart region
World State: Animals appear - birds, deer, fish (but they flee from player), lighting deepens and becomes more realistic
Visuals: Full color, dynamic day/night, birdsong and animal sounds
Purpose: Demonstrate mastery of concepts

Run 4: Mastery (True Ending)

Difficulty: One mistake allowed total, second mistake = full restart
World State: Habitable - animals don't flee, signs of habitation appear
Visuals: Warm, inviting, golden hour, peaceful sounds
Ending: Player wakes on beach, finds message in a bottle
Message: Dev message about math journey, signed "— ε"
Final moment: Camera shifts to third-person, showing player with epsilon tattoo on hand holding bottle
Purpose: Ultimate mastery challenge, true ending reveal

Unlocking/Selection

Run 1 must be completed first
After Run 1, players can select any difficulty (2, 3, or 4) from main menu
Only Run 4 completion unlocks true ending

Narrative Structure
The Loop

Player is ε, the person who left the notes
Each run is an iteration attempting to create a perfect world
Notes throughout show previous attempts, frustrations, recalculations
Epsilon tattoo visible on player's hand throughout game
Subtle hints build to revelation in Run 4

Environmental Storytelling

Failed attempts visible (scorch marks, broken objects)
Previous notes show progression: frustrated → confident → concerned
Notes reference "beginning again" to improve the world
World literally builds layer by layer with each run (Genesis parallel)

The Message in a Bottle (Run 4 Only)
Structure:

Personal dev story about struggling with then loving math
What the game hoped players would feel
Revelation: "Look at your hands. You've always known the way. — ε"
Forward-looking: "What will you build next?"

Tone: Reflective and intimate, not preachy. Earned reward for <1% who reach mastery.
Player Identity Reveal

Epsilon tattoo: Simple ε symbol on back of player's hand, visible during interactions
Signature: Notes signed with "— ε"
Subtle escalation: More evidence across runs as world reveals hidden notes
Final confirmation: Message in bottle references the tattoo directly

Technical Notes

Built in Godot (not custom Rust engine - ship the game first, build engines later)
First-person controller with mouse look and raycast interaction system
World state persists and builds across runs (terrain → vegetation → animals → habitation)
Input: WASD movement, mouse look, E to interact, Shift to sprint
Code style: PascalCase for variables (myVarName), snake_case for functions (my_func_name)

Development Philosophy

Focus on shipping a complete game in Godot
Use procedural generation in Blender for geometric assets
Prioritize puzzle design and math progression over technical complexity
Balance accessibility (Run 1) with elite challenge (Run 4)
Trust players to derive meaning (Witness-style) rather than explicit exposition

## Development Workflow & Asset Pipeline

### Current Phase: Greybox/Blockout
- Using primitives (cubes, planes, cylinders) to test gameplay and puzzle mechanics
- Focus on: Does the puzzle work? Is spacing right? Can players navigate?
- Don't worry about aesthetics yet - this phase can last months

### Planned Development Phases

**Phase 1: Greybox (Current)**
- Primitives for PUZZLES (doors, platforms, movable objects, interaction points)
- Simple terrain heightmaps for GROUND (basic hills/elevation from the start)
- Build 2-3 complete puzzle rooms to test mechanics
- Iterate until puzzles feel good

**Phase 2: Refined Greybox**
- Lock down proper scale and proportions
- Add placeholder collision shapes matching final intent
- Test full puzzle chains and progression
- Lock "playable space" dimensions

**Phase 3: Modular Assets**
- Replace primitives with modular pieces (wall tiles, floor tiles, etc.)
- Create library: wall sections (2m, 4m, corner, doorway), floor tiles (flat, sloped, stairs), puzzle-specific props
- These snap together like LEGO - geometric but prettier
- Collision stays mostly the same
- Lighting and materials start mattering

**Phase 4: Final Polish**
- Replace modular pieces with custom terrain/meshes where needed
- Add organic elements (rocks, vegetation for Run 2+, animals for Run 3+)
- Polish lighting, post-processing, details
- Custom meshes for hero areas (starting beach, boss rooms)

### Important Workflow Rules

**Avoid Rework:**
- Use consistent scale (if primitive cube is 2x2x2m, final door should be ~2m wide)
- Separate collision from visuals early (use CollisionShape3D separate from MeshInstance3D)
- Use scenes/instancing - make each object its own scene to swap internals later without moving
- Name clearly: "Wall_2m_Straight" not "Cube_017"

**Terrain Handling:**
- Use Godot's HeightMapShape3D for collision early
- Build HEIGHT VARIATION from the start (ramps, platforms at different elevations)
- Don't make everything flat - add elevation early to prevent surprises
- Build puzzle objects RELATIVE to terrain height
- Polish terrain last, but have SOME variation from the beginning

**Transition Timing:**
- Greybox → Modular: When 3-5 complete puzzle rooms feel good to play
- Modular → Polish: When ALL puzzles are built and entering content lock (no more design changes)
- **Don't transition too early** - biggest mistake is polishing before gameplay is locked

### Genesis Theme Aesthetic Advantage
The primitive aesthetic can actually serve the narrative:
- **Run 1**: Keep geometric/primitive (stone blocks emerging from void) - aesthetic
- **Run 2**: Same geometry + textures/vegetation
- **Run 3**: Add organic elements, round edges  
- **Run 4**: Full polish
This makes the "primitive" phase part of Run 1's aesthetic rather than throwaway work.

### Asset Creation Notes
- Building modular flat props (floors, walls, ramps) in Blender for Phase 3
- Using procedural generation for geometric assets where appropriate
- Target aesthetic: The Witness style - quasi-realism with simple geometry, excellent lighting



Available Primitive Assets (Greybox Phase)
The following modular primitives are available for level building and puzzle prototyping. All pieces use a 2m grid system and have subtle beveled edges for The Witness-style aesthetic.
Architectural Primitives

Floor Tile (floor_tile_01.glb) - 2×2m, 0.1m thick. Base grid unit.
Wall Section (wall_section_01.glb) - 2m wide × 3m tall × 0.2m thick. Modular wall panel.
Doorway (doorway_01.glb) - 2m wide × 3m tall with ~1.5-2m opening. Connects rooms. Uses -col suffix for proper collision with opening.

Elevation Primitives

Step (Small) (step_small_01.glb) - 2×2m, 0.2m tall. Intended for auto-step behavior (currently requires small jump - polish task).
Platform (step_platform_01.glb) - 2×2m, 0.5m tall. Jump-height platform for puzzle mechanics.
Ramp (ramp_01.glb) - 2m wide, 0.5m rise over 2m length (~14° slope). Gentle walkable slope.

Puzzle/Interaction Primitives

Pedestal (pedestal_01.glb) - 0.5×0.5m footprint, 1m tall with slightly wider top cap. For placing interactive objects.
Panel Mount (panel_mount_01.glb) - 1m wide × 1.5m tall, thin panel with border frame. Origin at bottom-center, comfortable viewing height (~0.5-2m off ground). For displaying equations and puzzle interfaces.

Asset Workflow Notes

All primitives created in Blender 5.0.1, exported as .glb
Origins set to bottom-center or geometry center as appropriate for placement
Transforms applied before export (critical for correct scaling in Godot)
Collision handled via -col suffix for architectural pieces with holes/openings
All pieces align to 2m grid in Godot with snap settings enabled (translate snap = 2m, rotation snap = 90°)

Known Polish Items (Future)

Ramp alignment with floor tiles slightly off
Step auto-walk behavior not yet implemented (CharacterBody3D limitation)
All pieces currently basic geometry - textures/materials to be added in Phase 3