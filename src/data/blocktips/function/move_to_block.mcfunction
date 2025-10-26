store result score #x temp run data get entity @s Pos[0]
store result score #y temp run data get entity @s Pos[1]
store result score #z temp run data get entity @s Pos[2]

store result entity @s Pos[0] int 1 run scoreboard players get #x temp
store result entity @s Pos[1] int 1 run scoreboard players get #y temp
store result entity @s Pos[2] int 1 run scoreboard players get #z temp

scoreboard players reset #x temp
scoreboard players reset #y temp
scoreboard players reset #z temp
