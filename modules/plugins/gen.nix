{
  config,
  lib,
  pkgs,
  helpers,
  ...
}:
let
  cfg = config.plugins.gen;
in
{
  options.plugins.gen = {
    enable = lib.mkEnableOption "gen";
    settings = {
      model = lib.mkOption {
        type = lib.types.str;
        description = "The default model to use.";
        default = "llama3.1";
      };
      quit_map = lib.mkOption {
        type = lib.types.str;
        description = "keymap to close response window.";
        default = "q";
      };
      retry_map = lib.mkOption {
        type = lib.types.str;
        description = "keymap to re-send the current prompt";
        default = "<c-r>";
      };
      accept_map = lib.mkOption {
        type = lib.types.str;
        description = "Keymap to replace the previous selection with the last result";
        default = "<c-cr>";
      };
      host = lib.mkOption {
        type = lib.types.str;
        description = "Host running the ollama service";
        default = "localhost";
      };
      port = lib.mkOption {
        type = lib.types.str;
        description = "Port on which the Ollama service is listening.";
        default = "11434";
      };
      display_mode = lib.mkOption {
        type = lib.types.str;
        description = "The display mode. Can be float or split or horizontal-split.";
        default = "float";
      };
      show_prompt = lib.mkOption {
        type = lib.types.bool;
        description = "Shows the prompt submitted to Ollama.";
        default = false;
      };
      show_model = lib.mkOption {
        type = lib.types.bool;
        description = "Displays which model you are using at the beginning of your chat session.";
        default = false;
      };
      no_auto_close = lib.mkOption {
        type = lib.types.bool;
        description = "Never closes the window automatically.";
        default = false;
      };
      file = lib.mkOption {
        type = lib.types.bool;
        description = "Write the payload to a temporary file to keep the command short.";
        default = false;
      };
      hidden = lib.mkOption {
        type = lib.types.bool;
        description = "Hide the generation window";
        default = false;
      };
      init = lib.mkOption {
        type = lib.types.anything;
        description = "Function to initialize Ollama";
        default = helpers.mkRaw ''
          function(opts) 
            pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
          end
        '';
      };
      command = lib.mkOption {
        type = lib.types.anything;
        description = "The command for the Ollama service.";
        default = helpers.mkRaw ''
          function(opts)
            local body = { model = opts.model, stream = true, }
            return "curl --silent --no-buffer -X POST http://" .. opts.host .. ":" .. opts.port .. "/api/chat -d $body"
          end
        '';
      };
      debuf = lib.mkOption {
        type = lib.types.bool;
        description = "Prints errors and the command which is run.";
        default = false;
      };
    };
    prompts = lib.mkOption {
      type = lib.types.attrsOf lib.types.attrs;
      default = { };
    };
  };
  config = lib.mkIf cfg.enable {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "gen";
        src = pkgs.fetchFromGitHub {
          owner = "David-Kunz";
          repo = "gen.nvim";
          rev = "488a745cd17a3dd6fc5280d66b3322b55118b28d";
          hash = "sha256-OHWipqYGW8SiYqZBjh71cQ44mU6sN3AbJ89tlfeN414=";
        };
      })
    ];
    extraConfigLua = ''
      require("gen").prompts = ${helpers.toLuaObject cfg.prompts}
      require("gen").setup(${helpers.toLuaObject cfg.settings})
    '';
  };
}
