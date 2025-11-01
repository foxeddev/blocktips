if block ~ ~ ~ note_block:
    data remove entity @s data.blocktips
    if block ~ ~ ~ note_block[instrument=banjo] run data modify entity @s data.blocktips.instrument set value "basedrum"
    if block ~ ~ ~ note_block[instrument=basedrum] run data modify entity @s data.blocktips.instrument set value "basedrum"
    if block ~ ~ ~ note_block[instrument=bass] run data modify entity @s data.blocktips.instrument set value "bass"
    if block ~ ~ ~ note_block[instrument=bell] run data modify entity @s data.blocktips.instrument set value "bell"
    if block ~ ~ ~ note_block[instrument=bit] run data modify entity @s data.blocktips.instrument set value "bit"
    if block ~ ~ ~ note_block[instrument=chime] run data modify entity @s data.blocktips.instrument set value "chime"
    if block ~ ~ ~ note_block[instrument=cow_bell] run data modify entity @s data.blocktips.instrument set value "cow_bell"
    if block ~ ~ ~ note_block[instrument=didgeridoo] run data modify entity @s data.blocktips.instrument set value "didgeridoo"
    if block ~ ~ ~ note_block[instrument=flute] run data modify entity @s data.blocktips.instrument set value "flute"
    if block ~ ~ ~ note_block[instrument=guitar] run data modify entity @s data.blocktips.instrument set value "guitar"
    if block ~ ~ ~ note_block[instrument=harp] run data modify entity @s data.blocktips.instrument set value "harp"
    if block ~ ~ ~ note_block[instrument=hat] run data modify entity @s data.blocktips.instrument set value "hat"
    if block ~ ~ ~ note_block[instrument=iron_xylophone] run data modify entity @s data.blocktips.instrument set value "iron_xylophone"
    if block ~ ~ ~ note_block[instrument=pling] run data modify entity @s data.blocktips.instrument set value "pling"
    if block ~ ~ ~ note_block[instrument=snare] run data modify entity @s data.blocktips.instrument set value "snare"
    if block ~ ~ ~ note_block[instrument=xylophone] run data modify entity @s data.blocktips.instrument set value "xylophone"

    if block ~ ~ ~ note_block[note=0] run data modify entity @s data.blocktips.note set value "F♯"
    if block ~ ~ ~ note_block[note=1] run data modify entity @s data.blocktips.note set value "G"
    if block ~ ~ ~ note_block[note=2] run data modify entity @s data.blocktips.note set value "G♯"
    if block ~ ~ ~ note_block[note=3] run data modify entity @s data.blocktips.note set value "A"
    if block ~ ~ ~ note_block[note=4] run data modify entity @s data.blocktips.note set value "A♯"
    if block ~ ~ ~ note_block[note=5] run data modify entity @s data.blocktips.note set value "B"
    if block ~ ~ ~ note_block[note=6] run data modify entity @s data.blocktips.note set value "C"
    if block ~ ~ ~ note_block[note=7] run data modify entity @s data.blocktips.note set value "C♯"
    if block ~ ~ ~ note_block[note=8] run data modify entity @s data.blocktips.note set value "D"
    if block ~ ~ ~ note_block[note=9] run data modify entity @s data.blocktips.note set value "D♯"
    if block ~ ~ ~ note_block[note=10] run data modify entity @s data.blocktips.note set value "E"
    if block ~ ~ ~ note_block[note=11] run data modify entity @s data.blocktips.note set value "F"
    if block ~ ~ ~ note_block[note=12] run data modify entity @s data.blocktips.note set value "F♯"
    if block ~ ~ ~ note_block[note=13] run data modify entity @s data.blocktips.note set value "G"
    if block ~ ~ ~ note_block[note=14] run data modify entity @s data.blocktips.note set value "G♯"
    if block ~ ~ ~ note_block[note=15] run data modify entity @s data.blocktips.note set value "A"
    if block ~ ~ ~ note_block[note=16] run data modify entity @s data.blocktips.note set value "A♯"
    if block ~ ~ ~ note_block[note=17] run data modify entity @s data.blocktips.note set value "B"
    if block ~ ~ ~ note_block[note=18] run data modify entity @s data.blocktips.note set value "C"
    if block ~ ~ ~ note_block[note=19] run data modify entity @s data.blocktips.note set value "C♯"
    if block ~ ~ ~ note_block[note=20] run data modify entity @s data.blocktips.note set value "D"
    if block ~ ~ ~ note_block[note=21] run data modify entity @s data.blocktips.note set value "D♯"
    if block ~ ~ ~ note_block[note=22] run data modify entity @s data.blocktips.note set value "E"
    if block ~ ~ ~ note_block[note=23] run data modify entity @s data.blocktips.note set value "F"
    if block ~ ~ ~ note_block[note=24] run data modify entity @s data.blocktips.note set value "F♯"

    if data entity @s data.blocktips.note:
        data modify storage blocktips:current_tip current_tip append value {"color":"white","text":""}
        data modify storage blocktips:current_tip current_tip append value {"color":"white","entity":"@s","nbt":"data.blocktips.note"}

    if data entity @s data.blocktips.instrument:
        data modify storage blocktips:current_tip current_tip append value {"color":"white","text":"\n"}
        data modify storage blocktips:current_tip current_tip append value {"color":"white","entity":"@s","nbt":"data.blocktips.instrument"}
