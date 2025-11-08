if score @s blocktips.timer matches 10.. run data modify entity @s interpolation_duration set value 0

if entity @s[tag=blocktips.active] if score @s blocktips.timer matches ..10 run scoreboard players add @s blocktips.timer 4
if entity @s[tag=!blocktips.active] if score @s blocktips.timer matches 1.. run scoreboard players remove @s blocktips.timer 3

if score @s blocktips.timer matches 11.. run scoreboard players set @s blocktips.timer 10
if score @s blocktips.timer matches ..0 run function ./remove

function ./update/scale

if score @s blocktips.timer matches ..9 run data modify entity @s interpolation_duration set value 1

title @a actionbar { nbt: "transformation.scale[0]", entity: "@s" }

data modify storage blocktips:current_tip current_tip set value [ "" ]

function ../block/lectern
function ../block/spawner
function ../block/jukebox
function ../block/beacon
function ../block/beehive
function ../block/bee_nest
function ../block/note_block
function ../block/enchanting_table

data modify entity @s text set from storage blocktips:current_tip current_tip
