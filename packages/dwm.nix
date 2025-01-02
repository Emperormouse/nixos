{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "dwm";
  version = "1.0";  # Update the version accordingly

  src = (builtins.fetchGit {
    url = "https://github.com/Emperormouse/dwm.git";
    shallow = true;
  }).outPath;  # Path to your modified source, or use a git repo

  buildInputs = with pkgs; [ gcc gnumake xorg.libX11 xorg.libXinerama xorg.libXft ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp dwm $out/bin
    runHook postInstall
  '';
}
