if block ~ ~ ~ spawner:
    data modify storage blocktips:current_tip temp.entity set from block ~ ~ ~ SpawnData.entity.id
    data modify storage blocktips:current_tip temp.delay set from block ~ ~ ~ Delay

    with storage blocktips:current_tip temp:
        $data merge storage blocktips:current_tip {current_tip:[{"color":"white","text":"$(entity)"},"\n",{"color":"gray","text":"⏳: $(delay)"}]}

    data remove storage blocktips:current_tip temp

    unless data block ~ ~ ~ SpawnData:
        data merge storage blocktips:current_tip {current_tip:""}
