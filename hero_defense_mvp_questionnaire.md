# Hero Defense — MVP Vision Questionnaire

Fill this out in as much or as little detail as you want. Short answers are fine.

The goal of this questionnaire is to lock down **your vision** before we write design docs, so later decisions in gameplay, balancing, systems, and implementation stay aligned with what **you** want.

---

## How to answer

You can answer in any of these ways:
- Write directly under each question
- Delete questions you do not care about yet
- Mark questions with `TBD`
- Add your own notes anywhere

You do **not** need to answer everything perfectly. Even rough preferences help.

---

# 1. Core Vision

## 1.1 Game identity
1. In one or two sentences, how would you describe the game?
“Hero Defense” = 1–8 player co-op FPS where the team holds a forward base at one end of a long battlefield, survives incoming waves, loots resources from kills, and adapts each run through random upgrade drafts.

2. What is the **main fantasy** you want the player to feel?
Not sure what this means. Like the lore? Not sure yet. 

3. What should make this game feel different from other co-op wave shooters?
Later in development (probably after the MVP) I want to add more unique mechanics like resource gathering, New Game++ or other replayability features.
The game theme should also be very comedic and lighthearted with a lot of humor and references, funny lines and jokes.

4. Which part is most important in the MVP?
   - shooting/combat
   - defending the base
   - class teamwork
   - progression/upgrades
   - atmosphere/presentation
   - something else

Pretty much all of the above are important for the MVP.

5. What parts are **not** important for the MVP?
More levels, leaderboards, resource gathering, statistics, new game+

## 1.2 Player experience
6. What should players feel during a wave?
Laughter, intensity, teamwork, meme-worthy/streaming highlight moments

7. What should players feel between waves?
Relief, anticipation, strategy planning, team chat

8. Should the tone feel more:
   - heroic
   - desperate
   - chaotic
   - tactical
   - arcadey
   - gritty
   - other

Arcadey, tactical, chaotic, comedic, lighthearted, meme-worthy

9. Is the game more about:
   - mowing down huge numbers of weak enemies
   - fighting fewer but more dangerous enemies
   - a mix

A mix

10. Should the game feel more casual/fun or intense/punishing?
Both. It should be fun and casual, but also have some intensity and challenge.

---

# 2. MVP Scope

11. For the first playable MVP, how many players do you actually want to support?
1-4 players

12. For the first MVP, how many classes do you want?
4

13. For the first MVP, how many enemy types do you want?
5 including a boss and a elite type

14. For the first MVP, how many maps/levels do you want?
One map to begin with.

15. For the first MVP, how many waves should a full run contain?
Let's start with 10.

16. Do you want a boss in the MVP?
Yes at wave 10.

17. What features do you already know should **not** be in the MVP?
More maps, leaderboards, resource gathering, statistics, new game+

18. What feature would make you say: “Now it feels like the real game”?
Going to next map after completing the current map, continuing the run with the same players and classes but with new challenges and enemies.
Seeing a leaderboard with player rankings and scores after the run is completed.
Some kind profile progression between runs.

---

# 3. Match Structure

19. What does the full match flow look like in your head?
    Example: lobby → class select → ready → wave 1 → upgrade phase → next wave → boss → win/lose screen

    Main Menu -> Host/Join -> Player Join -> Class Selection -> Ready -> Load map -> Preparation Phase -> Wave 1 -> Upgrade Phase -> Next Wave -> Boss -> Win/Lose Screen
    Later after Win/Lose: Next Map or Main Menu -> Summary Screen -> Profile Progression update -> New Run -> Feel that you have progressed since the last run.

20. How long should one full run ideally take?
If we're going with 10 waves at the MVP I'd say 10-20 minutes

21. Should players be able to join a match already in progress?
We will not implement that for now.

22. Should dead players stay dead until wave end, be revivable, or instantly respawn somehow?
The player will be dead until the end of the wave. Other players will be able to help them by reviving them but it will take time.

23. When does the run end?
    - base destroyed
    - all players dead
    - either one
    - something else

    Base destroyed. If all players are dead they will have to either wait until the base is destroyed or quit the run.
    However... the base will eventually have some defensive capabilities (if the players have upgraded or choosen an upgrade for that between waves),
    so if all payers die the base may still survive the wave, and then all players will respawn during the next upgrade phase.

24. What counts as a win?
When all enemies are defeated at the last wave.

25. Should there be difficulty settings in the MVP?
No difficulty settings in the MVP. We will develop the MVP as a "normal" difficulty

---

# 4. Core Combat Feel

26. What kind of FPS feel do you want?
    Examples: heavy, arcadey, fast, weighty, tactical, smooth, grounded

    Fast and smooth. Some movement options like jumping, sliding, dashing etc. Some of them will depend on abilities or character class.

27. Should movement be simple or advanced?
    Examples: sprint only, slide, dash, double jump, wallrun, crouch jump

    a mix. Simple to learn but with some advanced options.

28. Should combat focus more on:
    - accuracy/headshots
    - positioning
    - ability timing
    - crowd control
    - raw damage output

    A mix. All of them should matter.

29. How lethal should enemies be to players?
Difficulty will scale with the number of players in the game.
So the more players, the more lethal the enemies should be to a single player.
If playing solo, the player should be able to survive the first waves pretty easily no matter the combinations of upgrades.

30. How lethal should players be to enemies?
Pretty letal. Basic attacks are enough to kill most enemies in 1-2 hits in the beginning, but players will depend more on abilities and upgrades as the game progresses.

31. How much ammo pressure do you want?
I'm thinking about a mix. You will start with a basic weapon with unlimited ammo, and then you will be able to loot or buy new weapons that consumes ammo.

32. Should reloading and ammo management matter a lot or stay light?
I'm thinking about a mix. Some weapons will have unlimited ammo, but others will have limited ammo and you will need to manage them.

33. Should friendly fire exist?
No. Atleast not in the MVP. Maybe later in some kind of hardcore/chaos mode.

34. Should weak points/headshots matter a lot?
Yes. The enemiy types will have different weak points and headshots will deal more damage.

35. Should melee exist in the MVP?
Yes. Heavy basic weapon will be melee, and other players should be able to melee with their weapons if enemy is close enough.

36. Should players have grenades or secondary tools in the MVP?
Yes, grenades and other gadgets should be available.

---

# 5. Base Defense Vision

37. What exactly is the “base” in your vision?
    Example: a core, vehicle, generator, fortress gate, convoy, camp, drill, reactor

    Some kind of building/fort that needs to be defended. You will be able to build defenses around it and upgrade it.

38. Is the base stationary?
Yes, with the ability to expand it.

39. Should the base be just one health pool, or several parts/modules?
Initial base will have just one health pool, but players may upgrade it with external modules that adds more health pools.

40. Should players be able to repair the base during combat?
Yes, that will be a mechanic that players will have to manage and prioritize between combat.

41. Should players be able to build defenses in the MVP?
Yes.

42. If yes, what kinds of defenses do you imagine first?
    Examples: barricades, turrets, mines, healing station, shield generator

    Barricades and turrets to begin with.

43. Should base defenses be placed freely or only in fixed slots?
fixed slots. It will expand outside the base perimeter.

44. Should the base itself attack enemies?
Yes if upgraded with attack modules.

45. How important should base management be compared to shooting?
You could prioritize the player only, but then the base will be very weak later in the match.
You should be able to prioritize the base more than the player as well. Both should be viable and heavily depend on what upgrades you get to choose from  between waves.

46. Should some enemy types specifically target the base over players?
Yes. We should create one enemy type that specifically targets the base.

---

# 6. Map / Battlefield Vision

47. Describe the battlefield in your own words.
The battlefield should be a linear path with some branching options. It should feel like a strategic defensive position where players can build defenses and upgrade the base.
Inspiration taken from the Mulan battle scene where the army marches over a ridge/crest. 

48. How long/open should the level feel?
Not too open. The base area should be pretty narrow and then have like a battlefield that is a bit more open with branching paths.

49. Should the map be mostly one long front-facing battlefield, or include side paths/flanks?
Some branches for strategic positioning.

50. Should verticality matter much?
Not sure what that means.

51. Should players mostly defend one position, or move between several positions?
The base is the real defense point, but players could defend different branches of the battlefield.

52. Do you imagine one map for the MVP, or a map that changes during a run?
One map for the MVP.

53. Are there environmental hazards or interactables you want?
Not hazards, but enemies will drop resources that can be used to upgrade the base or player.
And they will also drop loot, like weapons, armor and gadgets that make the player stronger or get other abilities etc.

54. Are there any visual inspirations for the map/world?
Not really. 
---

# 7. Enemy Vision

55. What kind of enemies are they?
    Examples: zombies, aliens, monsters, robots, soldiers, fantasy creatures, corrupted things

    Not decided yet. We will start with cube-like enemies and see how it goes.

56. Why are they attacking the base?
    Not decided yet. We will start with a simple reason and see how it goes.

57. Should enemies feel mindless, military, animalistic, demonic, swarm-like, etc.?
    Not decided yet. We will start with a simple feeling and see how it goes.

58. What is more important for the MVP:
    - visual variety
    - behavior variety
    - scale/quantity

    visual will be prototype-like but I'd like to spend some time on it to make it look good even with simple CSG-models.
    Behaviour and scale/quantity should be prioritized for the MVP though.

59. Roughly what enemy roles do you imagine?
    Examples: runner, tank, ranged, support, siege, elite, boss

    Normal minions: Low HP, low damage, normal movement.
    Tank: High HP, low damage, maybe some special ability. Slow movement.
    Ranged: Medium HP, medium damage, maybe some special ability. Can attack from range.
    Siege: High HP, high damage, maybe some special ability. Will prioritize the base.
    Elite: High HP, high damage, maybe some special ability.
    Boss: High HP, high damage, maybe some special ability.

60. Do you want enemies to climb, jump, fly, burrow, or mostly run forward?
Mostly run forward and attack players if they are in the way.

61. Should there be special enemies that bypass the frontline and pressure the base directly?
Yes, siege types to begin with.

62. Should elites appear from the start or only later?
Later, maybe on wave 5 one will appear, and then maybe 2 on wave 7 and then a boss on wave 10.

63. What should make bosses feel special in this game?
They should be much bigger and have more health than regular enemies. Special abilities or patterns that make them unique.

---

# 8. Classes / Heroes

64. How many classes do you imagine in the finished game?
No idea. A lot. Depends on how good we can balance them.

65. How many classes do you want in the MVP?
4.

66. Should every class be very distinct, or just somewhat different loadouts?
Pretty distinct, with their unique abilities, but the real variation comes from how you upgrade them in a match.

67. What class fantasies do you already know you want?
    Examples: assault, heavy, engineer, medic, sniper, support, demolitions

    Assault/Regular DPS dude.
    Engineer: Build turrets, traps, mines etc.
    Medic: Heal teammates, summon drones etc.
    Sniper: Long Range DPS. Slow attack speed but high damage.

68. Should classes be locked before match start, or adjustable during the run somehow?
Locked before start.

69. Should class identity come more from:
    - primary weapon
    - abilities
    - passive traits
    - role in team
    - all equally

Class identity will be based on the character you choose, but you will be able to vary them through upgrades, abilities, weapons etc.

70. Should every class have:
    - primary weapon
    - secondary weapon
    - active ability
    - ultimate ability
    - passive
    - grenade/tool
    - melee

    MVP: Basic / Starter weapon, one active ability, some kind of gadget/tool.
    And then we will build upon this with upgrades during a match. Some upgrades may be "neutral" and available to all classes.

71. Should multiple players be allowed to pick the same class?
Yes.

72. Do you want strict team roles, or flexible self-sufficient classes?
Flexible self-sufficient classes.

---

# 9. Weapons and Abilities

73. What weapon style do you want overall?
    Examples: realistic guns, exaggerated sci-fi, improvised weapons, military, hero-shooter style

    exaggerated sci-fi combined with comedic elements.

74. Should guns feel grounded/realistic or highly gamey/powered-up?
Highly gamey and powered-up

75. Should recoil/spread matter a lot?
Depends on the weapon type and playstyle.

76. Should projectile weapons exist, or mostly hitscan for the MVP?
Let's start with hitscan and add projectile weapons later if needed.
However, all weapons won't be able to hit an enemy at any range.
So we will have to balance this with some kind of accuracy by distance thing.

77. Do you want weapon rarities/loot drops, or are weapons tied to class only?
I'd like to randomize the loot generation a lot, and have so any player can loot any weapon type, but it will only be available for a certain class.
So the players will have to trade weapons with each other by tossing them on the ground to each other.

78. Are upgrades modifying weapons, abilities, or both?
It could be passive upgrades to the character, active upgrades like new abilities, upgrading current abilities, or weapon upgrades.
It can also be upgrades to the base, so each player will have the ability to upgrade the teams base if they get that kind of roll.

79. Do you want flashy abilities in the MVP, or keep abilities simple first?
Somewhere in between. Some effects would be cool to have. 

80. Are ultimates part of your vision, or not necessary yet?
Not necessary yet.

81. Should ability cooldown reduction and spam builds be possible?
Yes, it depends on the ability. Some abilities might have longer cooldowns, while others might have shorter cooldowns.

82. Should status effects exist in the MVP?
    Examples: burn, bleed, shock, slow, poison

    Yes.

---

# 10. Progression During a Run

83. What do players gain when they kill enemies?
    - Money
    - Experience
    - Resources
    - Loot / Weapons etc

84. What do players gain when a wave ends?
    - Money
    - Experience
    - Choose 1-of-3 upgrades

85. Do you want XP/levels during a run?
Yes. The player will get one upgrade roll per completed wave, and one upgrade roll per level.

86. If yes, what does leveling up do?
It will give the player one upgrade roll and some basic stats increases.

87. Do you want multiple currencies/resources, or keep it simple in MVP?
Keep it simple. Only money during the match.

88. Should players upgrade only themselves, only the base, or both?
Both depending on what they roll each wave/level.

89. Should all players share resources, or have personal resources?
There will be two types. Shared and personal.
Shared resources will be given when killing enemies and completing waves, but players will also get personal resources based on their contribution.

90. If there are both shared and personal resources, what should each be used for?
Common resources should be used for team-wide upgrades, while personal resources should be used for personal upgrades.

91. Should players be able to save money for later, or be encouraged to spend every round?
Both. Spend now or wait to buy something more expensive.

92. Do you want an economy where greedy choices can hurt the team?
No. Atleast not in the beginning.
---

# 11. Roguelite Upgrade Drafting

93. Describe how you imagine the 1-of-3 choice system.
Each wave/level will give the player one upgrade roll, which will be a choice between 3 upgrades.
It will be like a popup menu when the wave ends. The upgrades are generated completely randomly. 
So sometimes you'll get 3 upgrades that are all good, and sometimes you'll get 3 upgrades that are all bad.
By bad I don't mean negative stats/upgrades/buffs, but rather upgrades that are not as good as they could be.

94. Should the choices be:
    - only personal
    - only team-wide
    - mostly personal with some team/base choices

    Both

95. How random should it feel?
    - very random/chaotic
    - somewhat controlled
    - highly curated

    Very random in the beginning. We will balance this over time.

96. Should players be able to reroll choices?
A player could loot a reroll card that may be used once to reroll the upgrade choices.

97. Should upgrades stack infinitely, to a cap, or only once?
Depends on the upgrade. Some may be ability unlocks, some may be stat boosts, some may be transformative effects.

98. Should upgrades be small stat boosts, transformative effects, or both?
It could be anything from stats boost, active abilities, upgrading the effects of the abilities, or upgrading a weapon with more damage or suffix/affixes.

99. Do you want synergy chains to be obvious or more discoverable/experimental?
discoverable and experimental

100. Should some upgrades be class-specific?
Yes, some of them.

101. Should some upgrades buff the whole team?
Yes, some of them.

102. Should some upgrades affect the base/defenses directly?
Yes.

103. Are there any upgrade ideas you already know you want?
Class abilities, weapon upgrades/new weapon abilities, suffixes/affixes, stat boosts, base/defense upgrades and more.

---

# 12. Meta Progression Outside a Run

104. Do you want persistent progression outside a run in the MVP?
Yes. 

105. If yes, what kind?
    Examples: unlock classes, unlock upgrades, unlock cosmetics, permanent stat progression, new maps

    Statistics and class abilities/weapons unlocks to begin with.

106. Should losing still award some progress?
Not in the MVP, but later on the player/profile/character class will leveling, get som resources etc.

107. Should players unlock content fast or slowly?
Both depending on what type of content.

108. Do you want account/profile leveling?
Yes, but not in the MVP.

109. Is this game meant to be replayable mainly because of run variety, unlocks, mastery, or all of them?
all of them eventually.
---

# 13. Multiplayer / Co-op Expectations

110. Is the game intended to be online only, LAN + online, or local possibilities too?
Online only.

111. Should one player always host and others join that player?
Yes.

112. How should joining work in your ideal version?
    Examples: direct IP, friend invite, lobby browser, Steam invite

    Friend invite, steam invite, lobby browser or direct IP.

113. For the MVP, what joining method do you want first?
public IP

114. Should the host control when the game starts and when the next wave begins?
When the game begins yes, but not next waves. It will be timer based.

115. Should the game pause between waves until host is ready, until all players are ready, or after a timer?
No. The game will progress automatically.

116. How important is low-latency precision shooting compared to “good enough” co-op feel?
Very important.

117. Are you okay with the host having the best experience/performance?
What does that even mean? All players should have the same experience.

118. Do you want voice chat in-game eventually, or not part of this project?
Eventually yes, but not in the MVP

119. Should co-op teamwork be required, encouraged, or optional?
encourages, but still optional. 

120. What should happen if a player disconnects mid-run?
The game should continue, but the disconnected player should be able to rejoin.

---

# 14. Difficulty and Balancing Philosophy

121. Should the game be balanced around solo, duo, 4 players, or full 8 players?
All of them, mort important solo, duo and 4 players to begin with. Maybe scale difficulty based on how many players are in the game.

122. Should solo play be supported in the MVP?
Yes.

123. Should enemy count scale with player count?
Yes.

124. Should enemy toughness scale with player count?
Yes.

125. Should base HP or economy scale with player count?
Yes.

126. Should the game lean toward fair challenge or chaotic spectacle?
Somewhere in between.

127. How punishing should mistakes be?
It should be punishing, but not too much.

128. Should some builds/classes be intentionally overpowered/fun, or should balance stay tighter?
Balance should be tight.

129. Is “fun broken combos” part of your vision?
Kinda, but not too much. It should LOOK fun and broken, but not be actually broken gameplay wise.
---

# 15. Failure, Recovery, and Tension

130. What are the main failure states?

- Player dies
- Base is destroyed

131. Should players be revivable by teammates?
Only by medics. Otherwise they have to wait for the wave completion.

132. Should there be a “downed” state before death?
No. Not in the MVP atleast.

133. Should the base be repairable from near-death, or should damage feel permanent?
Repairable with resources. 

134. Do you want comeback mechanics?
    Examples: emergency supply drop, last stand buff, bonus resources when behind

    Sure, but not planned for the MVP.

135. Should the game have quiet recovery phases, or stay pressured almost constantly?
Reovery will be between waves, maybe 30-45 seconds between waves.

---

# 16. Presentation / Tone / Style

136. What visual style do you imagine?
    Examples: realistic, stylized, gritty, cartoonish, low poly, sci-fi, dark fantasy

    In the beginning somewhere around stylized low-poly.

137. What camera/HUD feel do you imagine?
    First Person Shooter

138. Should the UI feel clean/minimal or information-rich?
Clean/Minimal with effective use of animations and visual feedback.

139. Should damage numbers, hit markers, kill feed, objective markers, and enemy health bars be visible?
Damage numbers, hit markers, health above enemies that you aim at.

140. How much visual chaos is too much?
There's nothing too chaotic, as long as it's not too overwhelming.

141. What audio/music feeling do you want during waves?
Somewhere between comedy and cool feedback.

---

# 17. Technical / Production Preferences

143. Are you aiming for PC first?
Yes.

144. Mouse and keyboard only at first, or controller too?
Mouse and Keyboard only

145. Do you care more about graphics, performance, or getting gameplay fun quickly?
Gameplay first, then graphics and performance, but we should not do stupid development choices that will hurt the game in the long run.

146. Are there any technical limits you want us to respect from the start?
Not really.

147. Are there any Godot-related preferences you already have?
No.

148. Are there any systems you already know you want to avoid because they seem too complex or not worth it?
No.
---

# 18. Priorities for Development

149. What should we prototype first?
A small CSG-node made prototype level where we can test the core gameplay mechanics.
First would be a player controller script with FPS movement and mouse look.
Second would be a basic weapon (just a placeholder model) that can shoot at enemies.
Third wouldbe spawn an enemy and make it attack, take damage, deal damage to the player and die.
After that we can add wave management, enemy types and basic UI etc.

150. What would worry you most if we got it wrong early?
Combat and the feeling of the movement.

151. Which system is the heart of the game?
Combat and movement.

152. Which system is the biggest risk?
Enemy AI

153. Which system can stay placeholder/ugly for a long time?
UI and menus.

154. What is the smallest version of this game that would still prove the concept?
A playable prototype with basic combat, movement, and wave management.


---

# 19. Hard “Yes / No” Direction Checks

Please answer these with **Yes / No / Maybe** and optional notes.

155. Solo playable? Yes
156. PvP ever planned? No
157. Friendly fire? No
158. Revives? Yes, from medics
159. Bosses in MVP? Yes
160. Buildable defenses in MVP? Yes
161. Base repairs during combat? Yes
162. Procedural/random upgrades between waves? Yes
163. Persistent unlocks outside runs? Yes
164. Join-in-progress? No
165. Same class allowed for multiple players? Yes
166. Strict class roles? Kinda
167. Large enemy hordes as a core fantasy? Yes
168. Flanking enemies in MVP? Yes
169. Side objectives in MVP? Not sure
170. One map for MVP? Yes
171. Direct IP for MVP? Yes
172. Steam integration later? Not in MVP

---

# 20. Anything Else

173. What have we not asked that you think is important?
174. Are there any game references we should study?
175. Are there any design directions you definitely do **not** want us to drift into?
176. If someone plays the MVP, what do you want their first reaction to be?

---

# Optional: Freeform Vision Dump

Write anything here in your own words.

