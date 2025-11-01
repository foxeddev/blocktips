if block ~ ~ ~ jukebox:
    data remove entity @s data.blocktips
    data modify entity @s data.blocktips.song set from block ~ ~ ~ RecordItem.id
    data modify entity @s data.blocktips.ticks_since_song_started set from block ~ ~ ~ ticks_since_song_started

    if data entity @s data.blocktips.song:
        data modify storage blocktips:current_tip current_tip append value {"color":"white","entity":"@s","nbt":"data.blocktips.song"}

    if data entity @s data.blocktips.ticks_since_song_started:
        store result score #ticks_since_song_started temp run data get entity @s data.blocktips.ticks_since_song_started
        store result entity @s data.blocktips.ticks_since_song_started int 1 run scoreboard players get #ticks_since_song_started temp
        data modify storage blocktips:current_tip current_tip append value {"color":"gray","text":"\n⏳ "}
        data modify storage blocktips:current_tip current_tip append value {"color":"gray","entity":"@s","nbt":"data.blocktips.ticks_since_song_started"}
        scoreboard players reset #ticks_since_song_started temp
