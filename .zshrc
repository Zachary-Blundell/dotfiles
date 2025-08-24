# -----------------------------------------------------
# Load modular configarion
# -----------------------------------------------------

for f in ~/.config/zshrc/*; do
    if [ ! -d $f ]; then
     source $f
    fi
done

## Exports might get added here it is best to move them to .zshenv
