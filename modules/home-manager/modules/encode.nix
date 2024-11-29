{ pkgs, ...}:

{
  home.packages = with pkgs; [
    (av1an.override {
      withAom = true;
      withSvtav1 = true;
      withVmaf = true;
      withMkvtoolnix = true;
    })
    ffmpeg
    # flac
    # subtitlecomposer
    subtitleedit
    mediainfo
    mkvtoolnix
    vapoursynth
    vapoursynth-bestsource
  ];
}
