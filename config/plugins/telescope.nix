{ ... }:
let
  mkKeymap = action: desc: {
    mode = "n";
    action = action;
    options.desc = desc;
  };
in
{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<Leader>sh" = mkKeymap "help_tags" "[S]earch [H]elp";
      "<Leader>sk" = mkKeymap "keymaps" "[S]earch [K]eymaps";
      "<Leader>sf" = mkKeymap "find_files" "[S]earch [F]iles";
      "<Leader>sb" = mkKeymap "builtin" "[S]earch [B]uiltin";
      "<Leader>sw" = mkKeymap "grep_string" "[S]earch current [W]ord";
      "<Leader>sg" = mkKeymap "live_grep" "[S]earch by [G]rep";
      "<Leader>sd" = mkKeymap "diagnostics" "[S]earch [D]iagnostics";
      "<Leader>sr" = mkKeymap "resume" "[S]earch [R]esume";
    };
    extensions = {
      fzf-native.enable = true;
      fzy-native.enable = true;
      ui-select.enable = true;
    };
  };
}
