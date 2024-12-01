{
  description = "My advent of code solutions for 2024 implemented in Roc https://www.roc-lang.org/";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # flake-utils.url = "github:numtide/flake-utils";
    roc.url = "github:roc-lang/roc";
  };

  outputs =
    {
      self,
      nixpkgs,
      # flake-utils,
      roc,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      # see "packages =" in https://github.com/roc-lang/roc/blob/main/flake.nix
      rocFull = roc.packages.${system}.full;
    in
    {
      formatter = pkgs.nixfmt-rfc-style;

      packages.${system}.download-inputs = import ./download-inputs.nix { inherit pkgs; };

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          git
          aoc-cli
          graalvm-ce
          nushell
          self.packages.${system}.download-inputs
        ];
        buildInputs = with pkgs; [
          rocFull
        ];

        # For vscode plugin https://github.com/ivan-demchenko/roc-vscode-unofficial
        shellHook = ''
          export ROC_LANGUAGE_SERVER_PATH=${rocFull}/bin/roc_language_server
          echo "ROC_LANGUAGE_SERVER_PATH: $ROC_LANGUAGE_SERVER_PATH"

          echo "Downloading available inputs ..."
          ${pkgs.lib.getExe self.packages.${system}.download-inputs}
        '';
      };
    };
}
