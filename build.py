from beet import Context, Language
import json


def main(ctx: Context):
    instruments = json.load(
        open(
            ctx.directory
            / "src/data/blocktips/function/block/note_block/instruments.json"
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
            / "src/data/blocktips/function/block/note_block/notes.json"
        )
    )

    if not ctx.assets.languages.get("blocktips:en_us"):
        ctx.assets.languages["blocktips:en_us"] = Language()

    ctx.assets.languages["blocktips:en_us"].merge(
        Language(
            {f"blocktips.note_block.note.{k}": v for k, v in notes.items()}
        )
    )
