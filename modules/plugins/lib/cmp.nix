{ helpers, lib, ... }:
let
  readOnly = lib.mkOption { readOnly = true; };
in
{
  options.lib.plugins.cmp = {
    mkSnippet = readOnly;
    mkMapping = readOnly;
    mkComparator = readOnly;
    mkCustomMapping = readOnly;
  };

  config.lib.plugins.cmp = {
    mkSnippet = fn: {
      expand =
        helpers.mkRaw # Lua
          ''
            function(args) ${fn} end
          '';
    };
    mkMapping =
      fn:
      helpers.mkRaw # Lua
        ''
          cmp.mapping.${fn}
        '';
    mkComparator =
      fn:
      helpers.mkRaw # Lua
        ''
          require("cmp.config.compare").${fn}
        '';
    mkCustomMapping =
      fn: mode:
      helpers.mkRaw # Lua
        ''
          cmp.mapping(function(fallback) ${fn} end, ${helpers.toLuaObject mode})
        '';
  };
}
