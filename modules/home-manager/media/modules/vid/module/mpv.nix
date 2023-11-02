{
  programs = {
    # TODO Profile based on hardware (High, Med, Low)
    # https://old.reddit.com/r/mpv/comments/fykeyo/is_there_a_way_to_swap_profiles_with_a_keybind/
    # TODO Config launches XWayland
    # running with --no-config seems to fix issue
    mpv = {
      enable = true;
      config = {
        profile = "gpu-hq";
        vo = "gpu-next";
        hwdec = false;
        gpu-api = "vulkan";

        #HDR
        #target-colorspace-hint = true;
        #HDR to SDR
        tone-mapping= "bt.2446a";
        tone-mapping-mode= "luma";

        # Gamma Correction
        target-trc = "srgb";

        # Scaling
        #scaler-resizes-only = true;
        glsl-shader = [
          "~~/shaders/FSRCNNX_x2_16-0-4-1.glsl"
          "~~/shaders/KrigBilateral.glsl"
          "~~/shaders/SSimDownscaler.glsl"
          "~~/shaders/adaptive-sharpen.glsl"
          "~~/shaders/noise_static_chroma.hook"
          "~~/shaders/noise_static_luma.hook"
        ];

        scale = "ewa_lanczos";
        scale-blur = 0.981251;

        cscale = "ewa_lanczossharp";

        correct-downscaling = true;
        dscale = "mitchell";

        # Shader Requirement (SSimDownscaler)
        linear-downscaling = false;
        sigmoid-upscaling = false;

        # Anti-Ringing
        ##Luma upscale deringing (Higher = Less rining, but more detail loss)
        scale-antiring = 0.7;
        ##Luma downscale deringing (Higher = Less rining, but more detail loss)
        dscale-antiring = 0.7;
        ##Chroma upscale deringing (Higher = Less rining, but more detail loss)
        cscale-antiring = 0.7;

        # Dithering
        dither-depth = "auto";
        dither = "fruit";
        ## 12-Bit
        #dither = "ordered";

        # Interpolation
        video-sync = "display-resample";
        interpolation = true;
        tscale = "sphinx";
        tscale-blur=0.6991556596428412;
        tscale-clamp = 0.0;
        #lower (e.g. 0.955) = sharper; higher (e.g. 1.005) = smoother
        tscale-radius = 1.0;

        # Debanding
        deband = true;
        ## Deband steps (More = Better quality, but higher GPU cost)
        deband-iterations = 4;
        ## Deband strength (More = Less banding, but more detail loss)
        deband-threshold = 46;
        ## Deband range (More = Less banding, but higher GPU cost)
        deband-range = 20;
        ## Dynamic Grain (More = More dynamic grain)
        deband-grain = 24;

        # Multi-track priority
        alang = "ja,jp,jpn,Japanese,en,eng,English";
        slang = "en,eng,English";

        # Audio
        # TODO Fix
        #ao = "pipewire";
        #audio-channels = "7.1,5.1,stereo";
        #audio-exclusive = true;
        volume = 100;
        volume-max = 200;
        audio-file-auto = "fuzzy";

        sub-auto = "fuzzy";
        subs-with-matching-audio = false;
        sub-font = "Noto Sans Mono";
        sub-bold = true;
        sub-file-paths = "ass:srt:sub:Sub:subs:Subs:subtitles:Subtitles";
        blend-subtitles = true;

        # General
        cursor-autohide = 1000;
        force-seekable = true;

        # Screenshot
        screenshot-sw = false;
        screenshot-high-bit-depth = true;
        screenshot-format = "png";
        screenshot-png-compression = 9;
        screenshot-directory = "/home/ecm/pic";
        screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";
      };
      bindings = {
        h = "cycle-values deband 'yes' 'no'";
      };
    };
  };
}
