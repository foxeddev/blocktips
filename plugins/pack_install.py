__all__ = [
    "PackInstallOptions",
    "pack_install",
]

from typing import Optional
from beet import Context, Advancement, Function, PluginOptions, configurable
from beet.core.utils import JsonDict, TextComponent, normalize_string


class PackInstallOptions(PluginOptions):
    # Advancement-related options
    icon: JsonDict = {"id": "minecraft:apple"}
    author_namespace: Optional[str] = None
    author_description: str = ""
    author_skull_owner: Optional[str] = None
    project_namespace: Optional[str] = None
    project_advancement_path: Optional[str] = None

    # Function-related options
    pack_namespace: Optional[str] = None
    advancement_path: Optional[str] = None
    install_function_path: Optional[str] = None
    install_function_tag: Optional[str] = None
    uninstall_function_path: Optional[str] = None
    uninstall_function_tag: Optional[str] = None
    send_success_messages: bool = False
    send_error_messages: bool = True


def beet_default(ctx: Context):
    ctx.require(pack_install)


@configurable(validator=PackInstallOptions)
def pack_install(ctx: Context, opts: PackInstallOptions):
    # Determine namespaces and IDs
    author_namespace = opts.author_namespace or normalize_string(ctx.project_author)
    project_namespace = opts.project_namespace or ctx.project_id
    skull_owner = opts.author_skull_owner or ctx.project_author
    if not author_namespace:
        raise ValueError("Missing author namespace.")
    if not skull_owner:
        raise ValueError("Missing skull owner.")

    project_advancement_path = (
        opts.project_advancement_path or f"{project_namespace}:installed"
    )

    namespace = opts.pack_namespace or normalize_string(ctx.project_id)
    advancement_path = opts.advancement_path or project_advancement_path
    install_function_path = opts.install_function_path or f"{namespace}:install"
    install_function_tag = opts.install_function_tag or f"#{namespace}:install"
    uninstall_function_path = opts.uninstall_function_path or f"{namespace}:uninstall"
    uninstall_function_tag = opts.uninstall_function_tag or f"#{namespace}:uninstall"

    # --- Create Advancements ---
    ctx.data["global:root"] = create_root_advancement()
    ctx.data[f"global:{author_namespace}"] = create_author_advancement(
        ctx.project_author, opts.author_description, skull_owner
    )
    ctx.data[project_advancement_path] = create_project_advancement(
        ctx.project_name, ctx.project_description, author_namespace, opts.icon
    )

    # --- Link install function to advancement reward ---
    ctx.data.advancements[advancement_path].data.setdefault("rewards", {})[
        "function"
    ] = install_function_path

    # --- Create Functions ---
    ctx.data.functions[install_function_path] = create_install_function(
        ctx, install_function_tag, opts.send_success_messages, opts.send_error_messages
    )
    ctx.data.functions[uninstall_function_path] = create_uninstall_function(
        ctx,
        uninstall_function_tag,
        opts.send_success_messages,
        opts.send_error_messages,
    )


# ----------------------
#  Advancement Creation
# ----------------------


def create_root_advancement():
    return Advancement(
        {
            "display": {
                "title": "Installed Datapacks",
                "description": "",
                "icon": {"id": "minecraft:knowledge_book"},
                "background": "minecraft:block/gray_concrete",
                "show_toast": False,
                "announce_to_chat": False,
            },
            "criteria": {"trigger": {"trigger": "minecraft:tick"}},
        }
    )


def create_author_advancement(
    author: TextComponent, author_description: TextComponent, skull_owner: str
):
    return Advancement(
        {
            "display": {
                "title": author,
                "description": author_description,
                "icon": {
                    "id": "minecraft:player_head",
                    "components": {"minecraft:profile": {"name": skull_owner}},
                },
                "show_toast": False,
                "announce_to_chat": False,
            },
            "parent": "global:root",
            "criteria": {"trigger": {"trigger": "minecraft:tick"}},
        }
    )


def create_project_advancement(
    project_name: TextComponent,
    project_description: TextComponent,
    author_namespace: str,
    icon: JsonDict,
):
    return Advancement(
        {
            "display": {
                "title": project_name,
                "description": project_description,
                "icon": icon,
                "announce_to_chat": False,
                "show_toast": False,
            },
            "parent": f"global:{author_namespace}",
            "criteria": {"trigger": {"trigger": "minecraft:tick"}},
        }
    )


# --------------------------
# Function Creation
# --------------------------


def create_install_function(
    ctx: Context, function_tag: str, success_messages: bool, error_messages: bool
):
    f = Function()
    if error_messages:
        f.append(
            f'execute unless function {function_tag} run return run tellraw @a {{"text":"Error: Could not install {ctx.project_name}","color":"red"}}'
        )
    else:
        f.append(f"function {function_tag}")
    if success_messages:
        f.append(
            f'tellraw @a {{"text":"Successfully installed {ctx.project_name}!","color":"green"}}'
        )
    return f


def create_uninstall_function(
    ctx: Context, function_tag: str, success_messages: bool, error_messages: bool
):
    f = Function()
    if error_messages:
        f.append(
            f'execute unless function {function_tag} run return run tellraw @a {{"text":"Error: Could not uninstall {ctx.project_name}","color":"red"}}'
        )
    else:
        f.append(f"function {function_tag}")
    if success_messages:
        f.append(
            f'tellraw @a {{"text":"Successfully uninstalled {ctx.project_name}!","color":"green"}}'
        )

    # Replaced .extend() with multiple .append() calls
    f.append(
        f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack"'
    )
    f.append(
        f'datapack disable "file/{ctx.project_id}_{ctx.project_version}_data_pack.zip"'
    )

    return f
