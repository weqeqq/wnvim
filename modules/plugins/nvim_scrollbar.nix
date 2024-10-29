{
  config,
  # helpers,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.plugins.nvim-scrollbar;
in
{
  options.plugins.nvim-scrollbar = {
    enable = lib.mkEnableOption "nvim-scrollbar";
    package = lib.mkPackageOption pkgs "nvim-scrollbar" {
      default = [
        "vimPlugins"
        "nvim-scrollbar"
      ];
    };
  };

  config = lib.mkIf cfg.enable {
    extraPlugins = [ cfg.package ];
    extraConfigLua = ''
      require("scrollbar").setup();
    '';
  };
}
