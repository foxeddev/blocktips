if block ~ ~ ~ spawner:
    data remove entity @s data.blocktips
    data modify entity @s data.blocktips.entity set from block ~ ~ ~ SpawnData.entity.id
    data modify entity @s data.blocktips.delay set from block ~ ~ ~ Delay

    if data entity @s data.blocktips.entity:
        data modify storage blocktips:current_tip current_tip append value {"color":"white","entity":"@s","nbt":"data.blocktips.entity"}

    if data entity @s data.blocktips.delay:
        store result score #delay temp run data get entity @s data.blocktips.delay
        store result entity @s data.blocktips.delay int 1 run scoreboard players get #delay temp
        data modify storage blocktips:current_tip current_tip append value {"color":"gray","text":"\n⏳ "}
        data modify storage blocktips:current_tip current_tip append value {"color":"gray","entity":"@s","nbt":"data.blocktips.delay"}
        scoreboard players reset #delay temp
