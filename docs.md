# Set-Up Todos (Arch/Linux)

## 1) Git & GitHub

```bash
# Set your global identity
git config --global user.email "zacharyblundell@live.com"
git config --global user.name  "Zachary Blundell"
```

### (Optional) Generate & add an SSH key for GitHub

```bash
# Create a new Ed25519 SSH key (recommended)
ssh-keygen -t ed25519 -C "zacharyblundell@live.com"

# Start the ssh-agent and add your key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Show your public key (copy this into GitHub → Settings → SSH and GPG keys)
cat ~/.ssh/id_ed25519.pub

# Test your connection (will prompt on first use)
ssh -T git@github.com
```

---

## 2) NordVPN

```bash
yay -S nordvpn
sudo groupadd nordvpn
sudo usermod -aG nordvpn "$USER"

# (Often needed on Arch)
sudo systemctl enable --now nordvpnd
# Then login:
nordvpn login
```

---

## 3) Node.js (via NVM)

### Install NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

#### Load NVM without restarting the shell

```bash
. "$HOME/.nvm/nvm.sh"
```

### Install Node.js 22 and verify

```bash
nvm install 22
nvm use 22
nvm alias default 22

# Verify versions (your exact numbers may differ slightly)
node -v     # e.g., v22.18.0
nvm current # e.g., v22.18.0
npm -v      # e.g., 10.9.3
```

### (Optional) Bun

```bash
# macOS/Linux/WSL
curl -fsSL https://bun.com/install | bash

# Verify
bun --version
```

---

## 4) Flatpak

```bash
sudo pacman -S flatpak

# Add Flathub (once)
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Example install
flatpak install flathub org.onlyoffice.desktopeditors
```

---

## 5) LazyVim helper (Mermaid CLI via Bun)

```bash
bun add -g @mermaid-js/mermaid-cli
```

If you want this as a single script instead, say the word and I’ll bundle it with safe checks and idempotent steps.
