{ pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.ecm = {
      initialHashedPassword = "$6$0UnQd7rFgNXISwvV$XeyvCXFW9t41cZprMb0F8JkSGdgLVVm5KeluDQ9Nf.LU.aI6gFQbxLIHhdhJWrVqkWLc3.Ht8c65ZSWISTGaR0";
      isNormalUser = true;
      extraGroups = [ "wheel" "scanner" "lp" "docker" "adbusers"];
    };
  };
}
