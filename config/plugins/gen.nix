{ ... }:
{
  plugins.gen = {
    enable = true;
    settings = {
      model = "codellama:13b";
      quit_map = "<Esc>";
      retry_map = "<C-r>";
      accept_map = "<C-CR>";
      display_mode = "split";
    };
    prompts = {
      Generate = {
        prompt = "$input";
        replace = true;
      };
      Chat = {
        prompt = "$input";
      };
    };
  };
}
