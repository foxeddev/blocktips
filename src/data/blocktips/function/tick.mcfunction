#!tag "minecraft:tick"

execute as @a[predicate=blocktips:has_tips]:
  function ./raycast
  execute at @e[type=marker,tag=blocktips.rc.target] with entity @s SelectedItem:
    $setblock ~ ~ ~ $(id)

kill @e[type=marker,tag=blocktips.rc.target]
