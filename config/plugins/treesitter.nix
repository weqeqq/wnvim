{ ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      ensureInstalled = [
        "bash"
        "c"
        "diff"
        "html"
        "lua"
        "luadoc"
        "markdown"
        "markdown_inline"
        "query"
        "vim"
        "vimdoc"
      ];
      highlight = {
        enable = true;
        additional_vim_regex_highlight = true;
      };
      indent = {
        enable = true;
        disable = [ "ruby" ];
      };
    };
  };
}
