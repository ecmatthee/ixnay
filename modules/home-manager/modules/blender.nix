{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # NOTE HIP Support
    # There exists a package for HIP Support:
    # blender-hip
    # But it seems to have issues with drivers and will probably be mainlined
    # later.
    # NOTE 2D Animation
    # https://www.blender.org/features/story-artist/
    blender
  ];
}
