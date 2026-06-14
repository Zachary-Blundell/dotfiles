### Package Structure

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) to symlink dotfiles into `$HOME`. Each top-level directory is a stow package that mirrors the target file hierarchy.

Packages are organized in three layers that stack on top of each other:

```
┌─────────────────────────────────┐
│  Role-specific (one per role)   │  hypr-laptop, zsh-wsl, etc.
├─────────────────────────────────┤
│  Omarchy (laptop & desktop)     │  hyprland, kitty, waybar, etc.
├─────────────────────────────────┤
│  Base (all roles)               │  nvim, zellij, zsh, scripts
└─────────────────────────────────┘
```

**Base** — Applied to every machine. Core editor config, shell setup, terminal multiplexer, and utility scripts.

**Omarchy** — Applied to graphical Omarchy desktops (laptop and desktop roles). Provides the full Hyprland environment: window manager config, status bar, terminal emulator, key remapping, and Omarchy-specific shell additions.

**Role-specific** — A single package per role that handles hardware or environment differences. `hypr-laptop` and `hypr-desktop` provide distinct monitor/input layouts, while `zsh-wsl` and `zsh-android` add platform-specific shell tweaks for their respective environments.

Because stow symlinks individual files, multiple packages can target the same directory without conflict — `zsh` and `zsh-omarchy` both place files under `.config/zsh`, layering role-specific additions on top of the shared base.

### Roles

| Role | Layers applied |
|---|---|
| `laptop` | base + omarchy + `hypr-laptop` |
| `desktop` | base + omarchy + `hypr-desktop` |
| `wsl` | base + `zsh-wsl` |
| `android` | base + `zsh-android` |

### Install

```bash
./install_dots.sh <role>
```

```bash
./install_dots.sh laptop
```

---

The key structural change from before: `omarchy` is now its own layer rather than being baked into individual roles. This means if you add a third graphical role in the future (say `htpc` or `server-with-display`), you just reference the `omarchy` array and add the role-specific package — no need to duplicate the full list.
