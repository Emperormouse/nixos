{ scripts, writeShellApplication, dmenu, dmenu_path }:

writeShellApplication {
  name = "dmenu_run";
  runtimeInputs = [ dmenu_path dmenu ];
  text = builtins.readFile "${scripts}/dmenu_run";
}
