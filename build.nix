let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  cwd = toString ./.;
  keepers = [ "app" "clients" "cmd" "config" "deps" "dev" "doc" "internal" "pkg" "server" "website" "make.go" "VERSION" "go.mod" "go.sum" ];
  keepersRegex ="^("+(builtins.concatStringsSep "|" (map (e: builtins.replaceStrings ["."] ["\\."] e) (map (e: cwd+"/"+e) keepers)))+").*";
  keepersFilter = path: type: builtins.isList (builtins.match keepersRegex path);
  inputSrcs = builtins.filterSource keepersFilter ./.;
  goPackageRoot = "perkeep.org";
  modRoot = "./";
  depsSha256="1h9dzlmj6f0xigf4q86sss7syrmncdljkkqhy0w6widr00m2sh0c"; #pkgs.lib.fakeSha256;
  godeps = pkgs.stdenv.mkDerivation {
    name = "perkeep-go-modules";
    src = inputSrcs;
    nativeBuildInputs = [ pkgs.buildPackages.go_1_16 pkgs.git ];
    GO111MODULE = "on";
    # GIT_SSL_CAINFO = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    # NIX_SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    # impureEnvVars = pkgs.lib.fetchers.proxyImpureEnvVars ++ [
    #   "GIT_PROXY_COMMAND" "SOCKS_SERVER" "GOPROXY"
    # ];
    configurePhase = ''
      runHook preConfigure

      # go will try to make a cache dir under ~/go/cache by default
      export GOCACHE=$TMPDIR/go-cache
      export GOPATH="$TMPDIR/go"
      cd "${modRoot}"

      runHook postConfigure
    '';
    buildPhase = ''
      runHook preBuild

      go mod vendor
      go run ./make.go -v -targets=perkeep.org/app/publisher

      runHook postBuild
    '';
    installPhase = ''
      runHook preInstall

      mkdir -p $out/
      cp --recursive --reflink=auto vendor $out/vendor
      cp --parents --reflink=auto app/publisher/publisher.js $out/

      runHook postInstall
    '';

    dontFixup = true;
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    outputHash = depsSha256;
  };
in
pkgs.stdenv.mkDerivation {
  name = "perkeep";
  src = inputSrcs;
  nativeBuildInputs = [ pkgs.buildPackages.go_1_16 ];
  configurePhase = ''
    runHook preConfigure

    # go will try to make a cache dir under ~/go/cache by default
    export GOCACHE=$TMPDIR/go-cache
    export GOPATH="$TMPDIR/go"
    cd "${modRoot}"
    rm -rf vendor
    cp -r --reflink=auto ${godeps}/{vendor,app} ./

    runHook postConfigure
  '';
  buildPhase = ''
    runHook preBuild

    go run ./make.go -offline

    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall

    mkdir -p $out
    dir="$GOPATH/bin"
    [ -e "$dir" ] && cp -r $dir $out

    runHook postInstall
  '';
}
