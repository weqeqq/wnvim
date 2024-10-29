{ helpers, config, ... }:
let
  inherit (config.lib.plugins.cmp)
    mkSnippet
    mkMapping
    mkComparator
    mkCustomMapping
    ;
in
{
  plugins.cmp = {
    enable = true;
    # autoEnableSources = false;
    luaConfig = {
      pre = # Lua
        ''
          luasnip = require("luasnip")
        '';
    };
    settings = {
      mapping = {
        # Confirm
        "<CR>" =
          mkCustomMapping
            # Lua
            ''
              if cmp.visible() then
                if luasnip.expandable() then
                  luasnip.expand()
                else 
                  cmp.confirm({
                    select = true,
                  })
                end
              else
                fallback()
              end
            ''
            [
              "i"
            ];
        # Select Next Item
        "<Tab>" =
          mkCustomMapping
            # Lua
            ''
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            ''
            [
              "i"
              "s"
            ];
        # Select Previous Item
        "<S-Tab>" =
          mkCustomMapping
            # Lua
            ''
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            ''
            [
              "i"
              "s"
            ];
        "<C-f>" = mkMapping ''scroll_docs(5)'';
        "<C-b>" = mkMapping ''scroll_docs(-5)'';
      };
      snippet =
        mkSnippet
          # Lua
          ''
            require("luasnip").lsp_expand(args.body)
          '';
      sources = [
        { name = "luasnip"; }
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
      completion = {
        completeopt = "menu,menuone";
      };
      sorting = {
        priority_weight = 2;
        comparators = [
          (mkComparator "offset")
          (mkComparator "exact")
          (mkComparator "score")
          (mkComparator "recently_used")
          (mkComparator "locality")
          (mkComparator "kind")
          (mkComparator "length")
          (mkComparator "order")
        ];
      };
    };
  };
}
