####################
## Install Node.js stuff
####################
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
export NVM_DIR="$HOME/.nvm"
. "$NVM_DIR/nvm.sh"

# Download and install Node.js:
nvm install 22

# Install bun (a fast all-in-one JavaScript runtime, package manager, and bundler)
curl -fsSL https://bun.com/install | bash
