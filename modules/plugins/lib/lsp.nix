{ helpers, lib, ... }:
let
  readOnly = lib.mkOption { readOnly = true; };
in
{
  options.lib.plugins.lsp = {
    mkKeymap = readOnly;
    mkExtraKeymap = readOnly;
    mkTelescopeKeymap = readOnly;
  };

  config = {
    lib.plugins.lsp = rec {
      mkKeymap = action: desc: {
        action = action;
        desc = desc;
      };
      mkExtraKeymap = key: action: desc: {
        mode = "n";
        key = key;
        action = action;
        options.desc = desc;
      };
      mkTelescopeKeymap =
        key: action: desc:
        mkExtraKeymap key (helpers.mkRaw ''require("telescope.builtin").${action}'') desc;
    };
  };
}
