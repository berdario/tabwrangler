{
  lib,
  config,
  dream2nix,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.nodejs-package-lock-v3
    dream2nix.modules.dream2nix.nodejs-granular-v3

    # Uncommenting this gives you a `nix develop` shell with all the dependencies installed
    # but it will also double memory usage when evaluating Nix
    # dream2nix.modules.dream2nix.nodejs-devshell-v3
  ];

  mkDerivation = {
    src = lib.cleanSource ./.;
    buildPhase = ''
      mkdir $out
      cp -r dist/* $out/
    '';
    checkPhase = ''
      npm run prerelease
    '';
    doCheck = true;
  };

  nodejs-package-lock-v3 = {
    packageLockFile = "${config.mkDerivation.src}/package-lock.json";
  };

  name = "tabwrangler";
  version = "7.5.1";
}