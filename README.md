# Minecraft Beet Project Template

A pre-configured GitHub template to quickly set up your [Beet](https://www.github.com/mcbeet/beet) project.

## Features

- Premade VSCode task for automated Beet project building

- Beet extensions like [Mecha](https://github.com/mcbeet/mecha), [Bolt](https://github.com/mcbeet/bolt), and [datapack installation advancements](plugins/advancement_icon.py)

- GitHub Workflow for automated error detection

- `.gitignore` template for Beet, Python, and Visual Studio Code

- Multiplayer / Server support

## Installation

1. Click "Use this template" on GitHub to create a new repository.

2. Clone your new repository to your device:

   ```sh
   git clone https://github.com/<your-username>/<your-repository>.git
   ```

3. Install Python and the [requirements](requirements.txt) using

   ```sh
   pip install -r requirements.txt
   ```

4. Change `template` to your project's namespace.

5. Link Beet to your Minecraft installation with

   ```sh
   beet link
   ```

6. **Done!** You can now add your custom functions, textures, and other assets.

## Usage

Build and update your project using Beet:

```sh
beet watch
```

If you are using VSCode, this should be done automatically.

Reload the datapack in-game with:

```mcfunction
/reload
```

## License

This project is licensed under [MIT](LICENSE).
