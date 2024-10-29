{ config, ... }:
let
  inherit (config.lib.plugins.lsp)
    mkKeymap
    mkTelescopeKeymap
    ;
in
{
  plugins.lsp = {
    enable = true;
    keymaps = {
      diagnostic = {
        "<Leader>q" = mkKeymap "setloclist" "Open diagnostic [Q]uickfix list";
      };
      lspBuf = {
        "<Leader>rn" = mkKeymap "rename" "LSP: [R]e[N]ame";
        "<Leader>ca" = mkKeymap "code_action" "LSP: [C]ode [A]ction";
        "<Leader>gd" = mkKeymap "declaration" "LSP: [G]oto [D]eclaration";
      };
      extra = [
        (mkTelescopeKeymap "<Leader>gd" "lsp_definitions" "LSP: [G]oto [D]efinitions")
        (mkTelescopeKeymap "<Leader>gr" "lsp_references" "LSP: [G]oto [R]eferences")
        (mkTelescopeKeymap "<Leader>gi" "lsp_implementations" "LSP: [G]oto [I]implementations")
        (mkTelescopeKeymap "<Leader>td" "lsp_type_definitions" "LSP: [T]ype [D]efinitions")
        (mkTelescopeKeymap "<Leader>ds" "lsp_document_symbols" "LSP: [D]ocument [S]ymbols")
        (mkTelescopeKeymap "<Leader>ws" "lsp_workspace_symbols" "LSP: [W]orkspace [S]ymbols")
      ];
    };
    servers = {
      nixd.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      dartls.enable = true;
    };
  };
}
