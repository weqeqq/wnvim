{ helpers, lib, ... }:
with lib;
{
  options.lib.plugins.alpha = {
    mkPadding = mkOption { };
    mkText = mkOption { };
    mkGroup = mkOption { };
    mkButton = mkOption { };
  };

  config = {
    lib.plugins.alpha = {
      mkPadding = value: {
        type = "padding";
        val = value;
      };
      mkText = value: {
        type = "text";
        val = value;
        opts = {
          position = "center";
        };
      };
      mkGroup = value: {
        type = "group";
        val = value;
        opts = {
          spacing = 1;
          priority = 1;
        };
      };
      mkButton =
        {
          value,
          shortcut,
          keybind ? null,
        }:
        {
          type = "button";
          val = value;
          opts = {
            width = 40;
            cursor = 3;
            shortcut = shortcut;
            position = "center";
            align_shortcut = "right";
            keymap = [
              "n"
              shortcut
              (if keybind == null then "<cmd>" + shortcut + "<CR>" else keybind)
              {
                noremap = true;
                silent = true;
                nowait = true;
              }
            ];
          };
          on_press = helpers.mkRaw ''
            function()
              vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes(
                  ${helpers.toLuaObject shortcut}, 
                  true, 
                  false, 
                  true),
                "normal",
                false)
            end
          '';
        };
    };
  };
}
