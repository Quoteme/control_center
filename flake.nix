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
        xmonadctl = (pkgs.callPackage
          (pkgs.fetchFromGitHub {
            owner = "quoteme";
            repo = "xmonadctl";
            rev = "v1.0";
            sha256 = "1bjf3wnxsghfb64jji53m88vpin916yqlg3j0r83kz9k79vqzqxd";
          })
          { });
        appdeps = with pkgs; [
          libnotify
          brightnessctl
          pamixer
          playerctl
          inputs.screenrotate.defaultPackage.x86_64-linux
          power-profiles-daemon
          xmonadctl
          xdotool
        ];
        dependencies = with pkgs; [
          pcre
          fontconfig
          # Dependencies for flutter
          at-spi2-core.dev
          clang
          cmake
          dart
          dbus.dev
          # flutter
          gtk3
          libdatrie
          libepoxy
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
        ] ++ appdeps;
      in
      rec {
        defaultPackage = packages.control_center;

        packages.control_center = pkgs.flutter37.buildFlutterApplication rec {
          pname = "control_center";
          version = "0.0.1";
          buildInputs = appdeps;
          src = ./.;
          autoDepsList = true;
          vendorHash = "sha256-ucC+BjM4zb7G4FvnfwzHFxY4pdV36sa8dR9KmT9q0K0=";
          postInstall = ''
            cp $src/toggle_control_center.sh $out/bin
            chmod +x $out/bin/toggle_control_center.sh
            wrapProgram $out/bin/toggle_control_center.sh \
            --prefix PATH : ${pkgs.lib.makeBinPath appdeps} \
            --prefix PATH : ${pkgs.playerctl}/bin \
            --prefix PATH : ${xmonadctl}/bin
            mkdir -p $out/share/applications/
            cp $src/control_center.desktop $out/share/applications/org.quoteme.ControlCenter.desktop
            mkdir -p $out/share/icons/
            cp $src/control_center_icon.png "$out/share/icons/control_center_icon.png"
          '';
        };

        devShells.default = with pkgs; mkShell {
          TMPDIR = "/path/to/temp/directory";
          FLUTTER_BUILD_DIR = "/tmp";
          NIX_LD_LIBRARY_PATH = lib.makeLibraryPath ([
            stdenv.cc.cc
            openssl
          ] ++ dependencies);
          NIX_LD = runCommand "ld.so" { } ''
            ln -s "$(cat '${pkgs.stdenv.cc}/nix-support/dynamic-linker')" $out
          '';
          buildInputs = dependencies;
        };
      }
    );
}
