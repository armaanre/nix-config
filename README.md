# nix-config

nix-prefetch-url --name displaylink-561.zip https://www.synaptics.com/sites/default/files/exe_files/2022-08/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu5.6.1-EXE.zip

# To rebuil

nix flake update
sudo nixos-rebuild switch --flake .#

# To enable dual monitors

xrandr --setprovideroutputsource 2 0
xrandr --output DVI-I-1-1 --mode 1024x768 --pos 1920x1080 --output DVI-I-2-2 --mode 1920x1080 --pos 0x0 --right-of DVI-I-1-1
