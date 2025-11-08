summon text_display ~ ~ ~ {
    billboard: "center",
    Tags: [ "blocktips.display", "blocktips.new" ],
    brightness: {sky: 15, block: 0},
    transformation: {
        left_rotation: [ 0f, 0f, 0f, 1f ],
        right_rotation: [ 0f, 0f, 0f, 1f ],
        translation: [ 0f, 0.8f, 1f ],
        scale: [ 0f, 0f, 0f ]
    }
}

as @e[type=text_display,tag=blocktips.new]:
    scoreboard players set @s blocktips.timer 0
    tag @s remove blocktips.new
