if block ~ ~ ~ #blocktips:has_tips:
    unless entity @e[type=text_display,tag=blocktips.display,distance=..0.5]:
        summon text_display ~ ~ ~ {billboard:"center",line_width:100,Tags:["blocktips.display"],brightness:{sky:15,block:0},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1f,1f],scale:[1f,1f,1f]}}
    as @n[type=text_display,tag=blocktips.display,distance=..0.5]:
        scoreboard players set @s blocktips.timer 1

        data modify storage blocktips:current_tip current_tip set value [""]

        function ./block/lectern
        function ./block/spawner
        function ./block/jukebox
        function ./block/beacon

        data modify entity @s text set from storage blocktips:current_tip current_tip
