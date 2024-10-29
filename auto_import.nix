path:
builtins.map (name: (builtins.toString path) + "/" + name) (
  builtins.filter (name: name != "default.nix") (builtins.attrNames (builtins.readDir path))
)
