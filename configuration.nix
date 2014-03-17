# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless.
  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "be-latin1";
    defaultLocale = "en_US.UTF-8";
  };

  environment.systemPackages =
    [ pkgs.vim 
      pkgs.sudo
      pkgs.emacs
      pkgs.wget
      pkgs.git 
      pkgs.cairo
      pkgs.zsh
    ];
  programs.zsh.enable = true;
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.virtualbox.enable = true;
  services.ntp.enable = true;
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.autorun = true;
  services.xserver.enable = true;
  services.xserver.layout = "be";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.kdm.enable = false;
  services.xserver.desktopManager.kde4.enable = false;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";  

}