if block ~ ~ ~ note_block:
    data remove entity @s data.blocktips

    for i in range(0, 25):
        if block ~ ~ ~ note_block[note=i] run data modify entity @s data.blocktips.note set value str(i)

    for i in list(ctx.meta.instruments.keys()):
        if block ~ ~ ~ note_block[instrument=i] run data modify entity @s data.blocktips.instrument set value i

    if data entity @s data.blocktips.note:
        with entity @s data.blocktips:
            $data modify storage blocktips:current_tip current_tip append value {"color":"white","translate":"blocktips.note_block.note.$(note)"}

        if data entity @s data.blocktips.instrument:
            data modify storage blocktips:current_tip current_tip append value "\n"

    if data entity @s data.blocktips.instrument:
        with entity @s data.blocktips:
            $data modify storage blocktips:current_tip current_tip append value {"color":"gray","translate":"blocktips.note_block.instrument.$(instrument)"}
