self: super:
{
  weechat = super.weechat.override {
    configure = { availablePlugins, ... }: {
      scripts = with super.weechatScripts; [
        edit
        weechat-autosort
        weechat-grep
        weechat-go
        multiline
        #weechat-otr
        #wee-slack
      ];
    };
  };
}
