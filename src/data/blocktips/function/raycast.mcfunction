store result score .limit blocktips.rc run attribute @s minecraft:block_interaction_range get 10
execute at @s anchored eyes positioned ^ ^ ^0.1 run function ./raycast/loop

function ./raycast/loop:
    scoreboard players remove .limit blocktips.rc 1
    execute unless block ~ ~ ~ #minecraft:replaceable run return run summon marker ~ ~ ~ {Tags:["blocktips.target"]}
    execute if block ~ ~ ~ #minecraft:replaceable if score .limit blocktips.rc matches 1.. positioned ^ ^ ^0.1 run function ./raycast/loop
