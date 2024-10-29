{ ... }:
{
  colorschemes.rose-pine = {
    enable = true;
    settings = {
      dark_variant = "main";
      dim_inactive_windows = false;
      highlight_groups =
        let
          VirtualText = {
            bg = "base";
            italic = true;
          };
        in
        rec {
          FloatTitle = {
            bg = "iris";
            fg = "surface";
            bold = true;
            italic = true;
          };
          FloatBorder.fg = "surface";

          DiagnosticVirtualTextError = VirtualText;
          DiagnosticVirtualTextWarn = VirtualText;
          DiagnosticVirtualTextHint = VirtualText;
          DiagnosticVirtualTextInfo = VirtualText;

          NeoTreeDirectoryIcon = {
            fg = "iris";
            bold = true;
          };
          NeoTreeDirectoryName = {
            fg = "iris";
            bold = true;
          };

          NeoTreeFloatBorder = FloatBorder;
          NeoTreeFloatTitle = FloatTitle;
          NeoTreeTitleBar = FloatTitle;
        };
    };
  };
}
