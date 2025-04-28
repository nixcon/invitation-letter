{
  description = "Gen letters";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          genPdf = pkgs.writeShellScriptBin "genPdf" ''
            ${pkgs.texliveFull}/bin/lualatex letter.tex
          '';
          default = genPdf;
        };

        apps = let
          selfPkgs = self.packages.${system};
        in rec {
          default = genPdf;
          genPdf = {
            type = "app";
            program = "${selfPkgs.genPdf}/bin/genPdf";
          };
        };
      }
    );
}
