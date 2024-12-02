# advent-of-code-2024
My advent of code solutions for 2024 implemented in the following languages:
- [Roc](https://www.roc-lang.org/)
- [Nix](https://nix.dev/manual/nix/latest/language/index.html)
- [Nushell](https://www.nushell.sh/)
<!-- - [Nickel](https://nickel-lang.org/) -->

Most implementations will me in Roc, as it is the language I want to learn this year. Nix
is on the list because I have gotten really hooked on it and [NixOS](https://nixos.org/) for both development and configuration
this year, and I want to see how the language fairs for more algorithmic tasks.

## Installation

All tools used are exposed in a development shell in `flake.nix` under `devShells.x86_64-linux.default`. Use `nix develop` to enter the shell, or better yet `echo "use flake" > .envrc; direnv allow` if you have [direnv](https://direnv.net/) installed (you should).
