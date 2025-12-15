#!tag "minecraft:tick"

as @a[predicate=blocktips:has_tips] run function ./raycast

as @e[type=marker,tag=blocktips.target] at @s align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #blocktips:has_tips:
    unless entity @e[type=text_display,tag=blocktips.display,distance=..0.01] run function ./display/create
    tag @e[type=text_display,tag=blocktips.display,distance=..0.01] add blocktips.active

as @e[type=text_display,tag=blocktips.display] at @s run function ./display/update

tag @e[type=text_display,tag=blocktips.display,tag=blocktips.active] remove blocktips.active
kill @e[type=marker,tag=blocktips.target]
