__all__ = [
    "InstallationFunctionOptions",
    "installation_function",
]


from typing import Optional

from beet import Context, Function, PluginOptions, configurable
from beet.core.utils import normalize_string


class InstallationFunctionOptions(PluginOptions):
    pack_namespace: Optional[str] = None
    advancement_path: Optional[str] = None
    install_function_path: Optional[str] = None
    install_function_tag: Optional[str] = None
    uninstall_function_path: Optional[str] = None
    uninstall_function_tag: Optional[str] = None
    send_success_messages: Optional[bool] = None
    send_error_messages: Optional[bool] = None


def beet_default(ctx: Context):
    ctx.require(installation_function)


@configurable(validator=InstallationFunctionOptions)
def installation_function(ctx: Context, opts: InstallationFunctionOptions):

    namespace = opts.pack_namespace or normalize_string(ctx.project_id)
    advancement_path = opts.advancement_path or f"{namespace}:installed"
    install_function_path = opts.install_function_path or f"{namespace}:install"
    install_function_tag = opts.install_function_path or f"#{namespace}:install"
    uninstall_function_path = opts.uninstall_function_path or f"{namespace}:uninstall"
    uninstall_function_tag = opts.uninstall_function_path or f"#{namespace}:uninstall"
    send_success_messages = opts.send_success_messages or False
    send_error_messages = opts.send_error_messages or True

    ctx.data.advancements[advancement_path].data["rewards"] = {
        "function": f"{install_function_path}"
    }

    ctx.data.functions[install_function_path] = Function(
        [f"function {install_function_tag}"]
    )

    ctx.data.functions[install_function_path] = create_install_function(
        ctx,
        uninstall_function_tag,
        send_success_messages,
        send_error_messages,
    )

    ctx.data.functions[uninstall_function_path] = create_uninstall_function(
        ctx,
        uninstall_function_tag,
        advancement_path,
        send_success_messages,
        send_error_messages,
    )


def create_advancement_reward(function_path):
    return {"function": f"{function_path}"}


def create_install_function(ctx, function_tag, success_messages, error_messages):
    f = Function()

    if error_messages:
        f.append(
            f'execute unless function {function_tag} run return run tellraw @a {{"text":"Error: Could not install {ctx.project_name}","color":"red"}}',
        )
    else:
        f.append(
            f"function {function_tag}",
        )
    if success_messages:
        f.append(
            f'tellraw @a {{"text":"Successfully installed {ctx.project_name}!","color":"green"}}',
        )

    return f


def create_uninstall_function(
    ctx, function_tag, advancement, success_messages, error_messages
):
    f = Function()

    if error_messages:
        f.append(
            f'execute unless function {function_tag} run return run tellraw @a {{"text":"Error: Could not uninstall {ctx.project_name}","color":"red"}}',
        )
    else:
        f.append(
            f"function {function_tag}",
        )
    if success_messages:
        f.append(
            f'tellraw @a {{"text":"Successfully uninstalled {ctx.project_name}!","color":"green"}}',
        )
    f.append(
        [
            f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack"',
            f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack.zip"',
        ]
    )

    return f
