if block ~ ~ ~ jukebox:
    data modify storage blocktips:current_tip temp.song set from block ~ ~ ~ RecordItem.id
    data modify storage blocktips:current_tip temp.ticks_since_song_started set from block ~ ~ ~ ticks_since_song_started

    with storage blocktips:current_tip temp:
        $data merge storage blocktips:current_tip {current_tip:[{"color":"white","text":"$(song)"},"\n",{"color":"gray","text":"⏳: $(ticks_since_song_started)"}]}

    data remove storage blocktips:current_tip temp

    unless data block ~ ~ ~ RecordItem:
        data merge storage blocktips:current_tip {current_tip:""}
