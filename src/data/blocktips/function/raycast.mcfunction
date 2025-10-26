tag @s add blocktips.rc
scoreboard players set .limit blocktips.rc 50
execute at @s anchored eyes positioned ^ ^ ^.1 run function ./raycast/loop

function ./raycast/loop:
    scoreboard players remove .limit blocktips.rc 1
    execute unless block ~ ~ ~ #minecraft:replaceable run return:
        summon marker ~ ~ ~ {Tags:["blocktips.rc.target"]}
    execute if block ~ ~ ~ #minecraft:replaceable if score .limit blocktips.rc matches 1.. positioned ^ ^ ^0.1 run function ./raycast/loop

tag @s remove raycaster
