self:
{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.programs.wnvim;
in
{
  options.programs.wnvim = {
    enable = lib.mkEnableOption "enable wnvim";
  };
  config = lib.mkIf cfg.enable { home.packages = [ self.packages.${pkgs.system}.wnvim ]; };
}
