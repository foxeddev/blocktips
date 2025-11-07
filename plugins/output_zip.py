"""Plugin that outputs the data pack and the resource pack in a local directory as a folder and zip archive."""

__all__ = [
    "OutputZipOptions",
    "output_zip",
]


from typing import Optional
from pathlib import Path

from beet import Context, PluginOptions, configurable


class OutputZipOptions(PluginOptions):
    directory: Optional[Path] = None


def beet_default(ctx: Context):
    ctx.require(output_zip)


@configurable(validator=OutputZipOptions)
def output_zip(ctx: Context, opts: OutputZipOptions):
    """Plugin that outputs the data pack and the resource pack in a local directory as a folder and a zip archive."""

    path = opts.directory or ctx.output_directory or ctx.directory

    ctx.data.save(
        path=path / f"{ctx.project_id}_{ctx.project_version}_data_pack",
        overwrite=True,
    )
    ctx.assets.save(
        path=path / f"{ctx.project_id}_{ctx.project_version}_resource_pack",
        overwrite=True,
    )
    ctx.data.save(
        path=path / f"{ctx.project_id}_{ctx.project_version}_data_pack.zip",
        overwrite=True,
    )
    ctx.assets.save(
        path=path / f"{ctx.project_id}_{ctx.project_version}_resource_pack.zip",
        overwrite=True,
    )
