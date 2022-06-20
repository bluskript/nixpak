{ go, stdenvNoCC }:

stdenvNoCC.mkDerivation {
  name = "launcher";
  src = ./.;
  
  nativeBuildInputs = [ go ];
  
  buildPhase = ''
    go build -ldflags "-s -w" main.go
  '';
  
  installPhase = ''
    install -Dm755 main $out/bin/launcher
  '';
}
