{ config, pkgs, ... }:

let
  scripts = (builtins.fetchGit {
    url = "https://github.com/Emperormouse/scripts.git";
    shallow = true;
  }).outPath;

  dmenu = pkgs.callPackage ./packages/dmenu.nix { };
  dmenu_path = pkgs.callPackage ./packages/dmenu_path.nix { inherit dmenu scripts; };
  dmenu_run = pkgs.callPackage ./packages/dmenu_run.nix { inherit dmenu dmenu_path scripts; };
in
{
  environment.systemPackages = with pkgs; [
    #custom Packages
    dmenu
    dmenu_path
    dmenu_run

    #bspwm
    bspwm
    pipewire
    nitrogen
    picom
    blueman
    sxhkd
    polybar
    dunst

    #zig
    zig
    zls

    #other
    git
    neovim
    alacritty
    htop
    neofetch
    cmatrix
    virtualbox
    discord
    vscodium-fhs
    flatpak
    gimp
    lutris
    superTuxKart
    superTux
    zsh
    pyright
    github-desktop
    chromium
    cowsay
    ccrypt
    plymouth
    nettools
    gparted
    signal-desktop
    unzip
    rofi
    android-studio
    android-tools
    openjdk
    psmisc
    kitty
    btop
    bat
    upower
    brightnessctl
    networkmanagerapplet
    pulseaudio
    librewolf-bin
    networkmanager_dmenu
    xorg.xev
    xclip
    meld
    xfce.xfce4-screenshooter
    wget
    qogir-theme
    qogir-icon-theme
    feh
    rustc
    rust-analyzer-unwrapped
    cargo
    retroarch
    gcc
    tree
    spotify
    tmux
    nmap
    eza
    bluez
    bluez-alsa
    pkg-config
    openssl
  ] ++
  #Python
  (with python312Packages; [ 
    requests 
    iwlib
    rich
  ]);
}

