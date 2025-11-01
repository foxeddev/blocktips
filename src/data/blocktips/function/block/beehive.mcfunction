if block ~ ~ ~ beehive:
    data remove entity @s data.blocktips
    data modify entity @s data.blocktips.bees set value 0
    data modify entity @s data.blocktips.bees set from block ~ ~ ~ bees
    if block ~ ~ ~ beehive[honey_level=0] run data modify entity @s data.blocktips.honey_level set value "0"
    if block ~ ~ ~ beehive[honey_level=1] run data modify entity @s data.blocktips.honey_level set value "1"
    if block ~ ~ ~ beehive[honey_level=2] run data modify entity @s data.blocktips.honey_level set value "2"
    if block ~ ~ ~ beehive[honey_level=3] run data modify entity @s data.blocktips.honey_level set value "3"
    if block ~ ~ ~ beehive[honey_level=4] run data modify entity @s data.blocktips.honey_level set value "4"
    if block ~ ~ ~ beehive[honey_level=5] run data modify entity @s data.blocktips.honey_level set value "5"

    if data entity @s data.blocktips.bees:
        scoreboard players set #bees temp 0
        function ./beehive/loop:
            if data entity @s data.blocktips.bees[0]:
                data remove entity @s data.blocktips.bees[0]
                scoreboard players add #bees temp 1
                function ./beehive/loop
        function ./beehive/loop
        store result entity @s data.blocktips.bees int 1 run scoreboard players get #bees temp
        scoreboard players reset #bees temp
        with entity @s data.blocktips:
            $data modify storage blocktips:current_tip current_tip append value {"color":"white","translate":"container.beehive.bees","with":[$(bees),5]}

    if data entity @s data.blocktips.honey_level:
        data modify storage blocktips:current_tip current_tip append value {"color":"white","text":"\n"}
        with entity @s data.blocktips:
            $data modify storage blocktips:current_tip current_tip append value {"color":"white","translate":"container.beehive.honey","with":[$(honey_level),5]}
