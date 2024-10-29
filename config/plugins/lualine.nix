{ helpers, ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        # theme = {
        # normal = {
        #   a = {
        #     fg = config.lib.rose-pine.moon.love;
        #   };
        # };
        # };

        globalstatus = true;
        icons_enabled = true;
        always_divide_middle = true;
        component_separators = {
          # left = "";
          # right = "";
          left = "";
          right = "";
        };
        section_separators = {
          # left = "";
          # right = "";
          left = "";
          right = "";
        };
        disabled_filetypes = {
          statusline = [ "neo-tree" ];
          winbar = [ ];
        };
        ignore_focus = [
          "neo-tree"
        ];
        refresh = {
          winbar = 1000;
          tabline = 1000;
          statusline = 1000;
        };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "filename" ];
        lualine_c = [ "branch" ];
        lualine_x = [ "" ];
        lualine_y = helpers.mkRaw ''{ { "fileformat", symbols = { unix = "Unix", dos = "Dos", mac = "Mac" } } }'';
        lualine_z = [ "location" ];
      };
      inactive_sections = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [ "" ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [ "" ];
      };
      winbar = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [ "" ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [ "" ];
      };
      inactive_winbar = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [ "" ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [ "" ];
      };
      tabline = { };
    };
  };
}
