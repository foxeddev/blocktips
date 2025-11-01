if block ~ ~ ~ lectern:
    data remove entity @s data.blocktips
    data modify entity @s data.blocktips.title set from block ~ ~ ~ Book.components."minecraft:written_book_content".title.raw
    data modify entity @s data.blocktips.author set from block ~ ~ ~ Book.components."minecraft:written_book_content".author
    data modify entity @s data.blocktips.generation set from block ~ ~ ~ Book.components."minecraft:written_book_content".generation

    if data entity @s data.blocktips.title:
        data modify entity @s data.blocktips.generation set value 0
        data modify storage blocktips:current_tip current_tip append value {"color":"white","entity":"@s","nbt":"data.blocktips.title"}

    if data entity @s data.blocktips.author:
        data modify storage blocktips:current_tip current_tip append value {"color":"white","text":"\n"}
        with entity @s data.blocktips:
            $data modify storage blocktips:current_tip current_tip append value {"color":"gray","translate":"book.byAuthor","with":["$(author)"]}

    if data entity @s data.blocktips.generation:
        data modify storage blocktips:current_tip current_tip append value {"color":"white","text":"\n"}
        with entity @s data.blocktips:
            $data modify storage blocktips:current_tip current_tip append value {"color":"gray","translate":"book.generation.$(generation)"}
