{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        c = [ "clang_format" ];
        cpp = [ "clang_format" ];
        nix = [ "nixfmt" ];
        json = [ "fixjson" ];
        js = [ "prettier" ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      format_on_save = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = "never" }
        end
      '';
      formatters = {
        nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
        fixjson.command = lib.getExe pkgs.fixjson;
        clang_format.command = pkgs.llvmPackages_latest.clang-tools + /bin/clang-format;
        prettier.command = lib.getExe pkgs.nodePackages_latest.prettier;
      };
    };
  };
}
