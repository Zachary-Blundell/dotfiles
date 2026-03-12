
Short answer: yes—those issues are almost always “missing desktop plumbing.”
You need three things in a minimal Hyprland setup:

1. a PolicyKit **authentication agent** (for admin prompts)
2. a **Secret Service** (keyring) so apps can store tokens/passwords
3. the **portals** glue so apps follow system settings

Here’s a clean, DE-like setup that fixes Brave’s keyring warning and stops Nextcloud from deauthing.

# 1) Install the desktop plumbing

```bash
# Polkit + a lightweight agent (pick ONE agent)
sudo pacman -S polkit
sudo pacman -S polkit-gnome        # GNOME-style agent (works everywhere)
# or: sudo pacman -S lxqt-policykit
# or: sudo pacman -S polkit-kde-agent

# Secret Service provider (pick ONE stack)
sudo pacman -S gnome-keyring seahorse    # easiest, works with most apps
# or (KDE stack): sudo pacman -S kwallet kwallet-pam
# or (power user): sudo pacman -S keepassxc  # enable Secret Service in settings

# Portals (already suggested earlier, but make sure)
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# For GPG/Passphrase prompts on Wayland
sudo pacman -S pinentry-qt     # or pinentry-gnome3
```

# 2) Start the agents in Hyprland

Add to `~/.config/hypr/hyprland.conf`:

```
# Polkit agent (choose the one you installed)
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
# or: exec-once = /usr/bin/lxqt-policykit-agent
# or: exec-once = /usr/lib/polkit-kde-authentication-agent-1

# Secret service (autostarts via PAM; see below). Fallback autostart:
exec-once = /usr/bin/gnome-keyring-daemon --start --components=secrets,pkcs11,ssh
```

> The polkit agent is **not** the polkit daemon itself—without an agent, GUI auth prompts won’t appear.

# 3) Make the keyring unlock automatically at login

If the keyring never unlocks, apps can’t read saved tokens → you get re-auth loops (e.g., Nextcloud).

Pick your login method and add PAM lines:

**If you log in with SDDM/GDM/LightDM** (recommended for simplicity)
Arch packages already ship PAM snippets; make sure these appear in the display manager’s PAM stack (they usually do by default):

```
auth     optional pam_gnome_keyring.so
session  optional pam_gnome_keyring.so auto_start
```

**If you log in with greetd/tuigreet**
Add the same two lines to `/etc/pam.d/greetd` (below your primary `auth` line).

**If you start Hyprland from a TTY**
Add to `/etc/pam.d/login` (or your getty’s PAM), then in your shell profile for safety:

```bash
# ~/.zprofile or ~/.profile (Wayland sessions)
eval "$(gnome-keyring-daemon --start --components=secrets,pkcs11,ssh)"
export SSH_AUTH_SOCK
```

**KWallet instead of gnome-keyring?**
Install `kwallet` + `kwallet-pam` and ensure the equivalent PAM lines for kwallet are present.

# 4) Brave + Nextcloud specifics

**Brave/Chromium keyring**
Brave detects a Secret Service. If it still complains, force it:

* Edit `/usr/share/applications/brave-browser.desktop` *or* copy to `~/.local/share/applications/` and add to `Exec`:

```
--password-store=gnome    # (or kwallet, if using KDE stack)
```

* Make sure `libsecret` is installed (pulled in with gnome-keyring on Arch).

**Nextcloud client**

* Arch’s client uses `qtkeychain`. It will store OAuth tokens in **org.freedesktop.secrets** if available.
* Once your Secret Service is up and unlocking via PAM, log in **one last time**; the token should persist and survive restarts.

# 5) GPG agent + pinentry (for signed commits, Brave’s signing, etc.)

Configure a Wayland-friendly pinentry so passphrase prompts actually appear:

```
mkdir -p ~/.gnupg
printf '%s\n' "pinentry-program /usr/bin/pinentry-qt" >> ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent
```

(Use `pinentry-gnome3` if you prefer GNOME dialogs.)

# 6) Portals sanity check

Make sure only one main portal backend is active for Hyprland:

```bash
sudo pacman -Rns xdg-desktop-portal-wlr  # if you previously had it
# keep: xdg-desktop-portal + xdg-desktop-portal-hyprland + xdg-desktop-portal-gtk
```

Log out/in; check with:

```bash
systemctl --user status xdg-desktop-portal.service
```

# 7) Quick test checklist

* Run `secret-tool store --label test foo bar` then `secret-tool lookup foo bar` → returns value if Secret Service is working.
* Run `polkit` test: try a root action from a GUI app (e.g., `gnome-disks`) and confirm you get a password dialog.
* Start Brave: no “keyring” warning, passwords can be saved.
* Start Nextcloud: sign in once, then restart session—should stay authenticated.

---

If you tell me how you log in (SDDM/GDM/greetd/TTY) and which stack you prefer (gnome-keyring vs kwallet vs keepassxc), I’ll give you the exact PAM snippet and the `exec-once` lines tailored to your setup.
