{ ... }:
{
  keymaps = [
    # Clear highlights on search when pressing <Esc> in normal mode.
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    # Windows navigation.
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
    }
  ];
}
