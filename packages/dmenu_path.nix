{ scripts, writeShellApplication, dmenu }:

writeShellApplication {
  name = "dmenu_path";
  runtimeInputs = [ dmenu ];
  text = builtins.readFile "${scripts}/dmenu_path";
}
