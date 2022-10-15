{
  description = "Control center to set brightness, window-manager layout, etc.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/flake-utils";
    };
    screenrotate.url = "github:Quoteme/screenrotate";
    screenrotate.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        # based on
        # https://discourse.nixos.org/t/flutter-run-d-linux-build-process-failed/16552/3
        appdeps = with pkgs; [
          libnotify
          brightnessctl
          pamixer
          playerctl
          inputs.screenrotate.defaultPackage.x86_64-linux
          power-profiles-daemon
        ];
        dependencies = with pkgs; [
          # dependencies for flutter
          at-spi2-core.dev
          clang
          cmake
          dart
          dbus.dev
          flutter
          gtk3
          libdatrie
          libepoxy.dev
          libselinux
          libsepol
          libthai
          libxkbcommon
          ninja
          pcre
          pkg-config
          util-linux.dev
          xorg.libXdmcp
          xorg.libXtst
          cairo.dev
          # Dependencies for the flutter app
        ] ++ appdeps;
      in
        rec {
          defaultPackage = packages.control_center;

          packages.control_center = pkgs.flutter.mkFlutterApp rec {
            pname = "control_center";
            version = "0.0.1";
            buildInputs = appdeps;
            src = ./.;
            vendorHash = "sha256-6xEBN7+IFqDiRKidTNWSPgKJ7R1tcpsaSFSSBeubTbg=";
            postInstall = ''
              cp $src/toggle_control_center.sh $out/bin
              chmod +x $out/bin/toggle_control_center.sh
              wrapProgram $out/bin/toggle_control_center.sh \
                --prefix PATH : ${pkgs.lib.makeBinPath appdeps} : ${playerctl/bin}
            '';
          };

          devShells.default = pkgs.mkShell {
            buildInputs = dependencies;
            # based on
            # https://discourse.nixos.org/t/flutter-run-d-linux-build-process-failed/16552/3#:~:text=The%20problem%20was%20that%20flutter%20does%20not%20use%20NixOS%20way%20to%20look%20for%20libraries%20during%20linking%20(most%20likely%20a%20bug%20in%20the%20package)%2C%20so%20LD_LIBRARY_PATH%2C%20which%20is%20unused%20on%20NixOS%20must%20be%20set
            shellHook = ''
              export LD_LIBRARY_PATH=${pkgs.libepoxy}/lib:$LD_LIBRARY_PATH
              export PUB_CACHE="./.cache/pub_cache"
            '';
          };
        }
      );
}
