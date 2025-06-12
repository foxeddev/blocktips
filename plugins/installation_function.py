__all__ = [
    "InstallationFunctionOptions",
    "installation_function",
]


from typing import Optional

from beet import Context, PluginOptions, configurable
from beet.core.utils import normalize_string


class InstallationFunctionOptions(PluginOptions):
    pack_namespace: Optional[str] = None
    advancement_path: Optional[str] = None
    function_path: Optional[str] = None


def beet_default(ctx: Context):
    ctx.require(installation_function)


@configurable(validator=InstallationFunctionOptions)
def installation_function(ctx: Context, opts: InstallationFunctionOptions):

    namespace = opts.pack_namespace or normalize_string(ctx.project_id)
    advancement_path = opts.advancement_path or f"{namespace}:installed"
    function_path = opts.function_path or f"{namespace}:installed"

    ctx.data.advancements[advancement_path].data["rewards"] = create_advancement_reward(
        function_path
    )


def create_advancement_reward(function_path):
    return {"function": f"{function_path}"}
