#!tag "minecraft:tick"

as @a[predicate=blocktips:has_tips]:
    function ./raycast
    as @e[type=marker,tag=blocktips.rc.target]:
        function ./move_to_block
        at @s positioned ~0.5 ~0.5 ~0.5:
            function ./test_blocks

kill @e[type=marker,tag=blocktips.rc.target]
kill @e[type=text_display,tag=blocktips.display,scores={blocktips.timer=..0}]
scoreboard players remove @e[type=text_display,tag=blocktips.display] blocktips.timer 1
