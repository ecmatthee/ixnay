{pkgs, ...}:

{
  home.packages = with pkgs; [
    #lua
    luajit
    luajitPackages.luarocks
    luajitPackages.fennel
    lua-language-server
    stylua
    love
  ];
}
