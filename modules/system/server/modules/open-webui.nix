{
  services = {
    open-webui = {
      enable = true;
      port = 19020;
      host = "127.0.0.1";
      openFirewall = false;
      environment = {
        WEBUI_AUTH = "True";
        ENABLE_LOGIN_FORM = "True";
        ENABLE_SIGNUP = "True";
        ADMIN_EMAIL = "llm@ecmatthee.com";
        ENABLE_OLLAMA_API = "True";
        OLLAMA_BASE_URL = "http://localhost:11434";
        ENABLE_RAG_WEB_SEARCH = "True";
        RAG_WEB_SEARCH_ENGINE = "duckduckgo";
      };
    };
  };
}
