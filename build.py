from beet import BlockTag, Context, FunctionTag, Language
import json


def main(ctx: Context):
    instruments = json.load(
        open(
            ctx.directory
            / "src/data/blocktips/function/block/minecraft/note_block/instruments.json"
        )
    )

    ctx.meta["instruments"] = instruments

    if not ctx.assets.languages.get("blocktips:en_us"):
        ctx.assets.languages["blocktips:en_us"] = Language()

    ctx.assets.languages["blocktips:en_us"].merge(
        Language(
            {f"blocktips.note_block.instrument.{k}": v for k, v in instruments.items()}
        )
    )

    notes = json.load(
        open(
            ctx.directory
            / "src/data/blocktips/function/block/minecraft/note_block/notes.json"
        )
    )

    if not ctx.assets.languages.get("blocktips:en_us"):
        ctx.assets.languages["blocktips:en_us"] = Language()

    ctx.assets.languages["blocktips:en_us"].merge(
        Language({f"blocktips.note_block.note.{k}": v for k, v in notes.items()})
    )

    if not ctx.data.block_tags.get("blocktips:has_tips"):
        ctx.data.block_tags["blocktips:has_tips"] = BlockTag()

    if not ctx.data.function_tags.get("blocktips:blocks"):
        ctx.data.function_tags["blocktips:blocks"] = FunctionTag()

    for function in ctx.data.functions.match("blocktips:block/*"):
        block = function.removeprefix("blocktips:block/").replace("/", ":")
        ctx.data.function_tags["blocktips:blocks"].append(FunctionTag({"values": [function]}))
        ctx.data.block_tags["blocktips:has_tips"].append(BlockTag({"values": [block]}))
