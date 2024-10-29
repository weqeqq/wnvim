{
  helpers,
  config,
  lib,
  ...
}:
{
  options.signs = lib.mkOption {
    type = lib.types.attrs;
    default = { };
  };

  config = {
    extraConfigLua = ''
      for hl, icon in pairs(${helpers.toLuaObject config.signs}) do
        vim.fn.sign_define(hl, { 
          text   = icon, 
          texthl = hl,
          nulhl  = hl })
      end
    '';
  };
}
