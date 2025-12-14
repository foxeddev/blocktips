import math

if block ~ ~ ~ enchanting_table:
    for x in [-2, -1, 0, 1, 2]:
        for y in range(0, 2):
            for z in [-2, -1, 0, 1, 2]:
                if abs(x) == 2 or abs(z) == 2:
                    gx = int(x / 2)
                    gz = int(z / 2)

                    if block ~gx ~y ~gz #minecraft:replaceable:
                        if block ~x ~y ~z minecraft:bookshelf:
                            scoreboard players add .bookshelves temp 1

    store result entity @s data.blocktips.bookshelves int 1 run scoreboard players get .bookshelves temp
    scoreboard players reset .bookshelves temp
    data modify storage blocktips:current_tip current_tip append value {"color":"white","entity":"@s","nbt":"data.blocktips.bookshelves"}
    data modify storage blocktips:current_tip current_tip append value {"color":"white","text":"/15"}
