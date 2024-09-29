{
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    # loadModels = [
    #   "gemma2:9b"
    #   "llama3.1:8b"
    #   "llava:13b"
    # ];
    environmentVariables = {
      OLLAMA_GPU_OVERHEAD = "1073741824";
    };
    rocmOverrideGfx = "10.3.0";
    # host = "[::]";
    port = 11434;
    openFirewall = false;
  };
}
