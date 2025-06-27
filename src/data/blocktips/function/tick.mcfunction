#!tag "minecraft:tick"

execute as @a:
  function ./raycast
  execute at @e[type=marker,tag=blocktips.rc.target] with entity @s SelectedItem:
    $setblock ~ ~ ~ $(id)

kill @e[type=marker,tag=blocktips.rc.target]
