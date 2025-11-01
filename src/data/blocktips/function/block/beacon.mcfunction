if block ~ ~ ~ beacon:
    data modify storage blocktips:current_tip temp.primary_effect set from block ~ ~ ~ primary_effect
    data modify storage blocktips:current_tip temp.secondary_effect set from block ~ ~ ~ secondary_effect
    data modify storage blocktips:current_tip temp.levels set from block ~ ~ ~ Levels

    if data storage blocktips:current_tip temp.primary_effect:
        data modify storage blocktips:current_tip current_tip append value "① "
        data modify storage blocktips:current_tip current_tip append string storage blocktips:current_tip temp.primary_effect

    if data storage blocktips:current_tip temp.secondary_effect:
        data modify storage blocktips:current_tip current_tip append value "\n② "
        data modify storage blocktips:current_tip current_tip append string storage blocktips:current_tip temp.secondary_effect

    if data storage blocktips:current_tip temp.levels:
        data modify storage blocktips:current_tip current_tip append value "\n↑ "
        data modify storage blocktips:current_tip current_tip append string storage blocktips:current_tip temp.levels

    data remove storage blocktips:current_tip temp
