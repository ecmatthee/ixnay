{ lib, ... }:

{
  imports = [
    ./modules/amdgpu_top.nix
    ./modules/archives.nix
    ./modules/aria2.nix
    ./modules/bat.nix
    ./modules/blender.nix
    ./modules/btop.nix
    ./modules/chromium.nix
    ./modules/darktable.nix
    ./modules/direnv.nix
    ./modules/duf.nix
    ./modules/encode.nix
    ./modules/eza.nix
    ./modules/fish.nix
    ./modules/firefox.nix
    ./modules/foot.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/gpg.nix
    ./modules/gpodder.nix
    ./modules/hakuneko.nix
    ./modules/heroic.nix
    ./modules/hugin.nix
    ./modules/hyfetch.nix
    ./modules/hyperfine.nix
    ./modules/imagemagick.nix
    ./modules/imv.nix
    ./modules/inkscape.nix
    # ./modules/itch.nix
    ./modules/jq.nix
    ./modules/kdenlive.nix
    ./modules/keepassxc.nix
    ./modules/krita.nix
    ./modules/less.nix
    ./modules/libre-office.nix
    ./modules/libsecret.nix
    ./modules/mako.nix
    ./modules/mangohud.nix
    ./modules/mat2.nix
    ./modules/mpv.nix
    ./modules/music.nix
    ./modules/ncdu.nix
    ./modules/neovim
    ./modules/parted.nix
    ./modules/qalculate.nix
    ./modules/qbittorrent.nix
    ./modules/ripgrep.nix
    ./modules/rofi.nix
    ./modules/ssh.nix
    ./modules/sway.nix
    ./modules/thunderbird.nix
    ./modules/tokei.nix
    ./modules/vkbasalt
    ./modules/waybar.nix
    ./modules/webcord.nix
    ./modules/wget.nix
    ./modules/xdg.nix
    ./modules/yazi.nix
    ./modules/yt-dlp.nix
    ./modules/zathura.nix
    ./modules/zps.nix
  ];
}
