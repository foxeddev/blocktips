if block ~ ~ ~ lectern:
    data modify storage blocktips:current_tip temp.title set from block ~ ~ ~ Book.components."minecraft:written_book_content".title.raw
    data modify storage blocktips:current_tip temp.author set from block ~ ~ ~ Book.components."minecraft:written_book_content".author
    data merge storage blocktips:current_tip {temp:{generation:0}}
    data modify storage blocktips:current_tip temp.generation set from block ~ ~ ~ Book.components."minecraft:written_book_content".generation

    with storage blocktips:current_tip temp:
        $data merge storage blocktips:current_tip {current_tip:[{"color":"white","text":"$(title)"},{"text":"\n"},{"color":"gray","translate":"book.byAuthor","with":["$(author)"]},{"text":"\n"},{"color":"gray","translate":"book.generation.$(generation)"}]}

    data remove storage blocktips:current_tip temp

    unless data block ~ ~ ~ Book:
        data merge storage blocktips:current_tip {current_tip:""}
