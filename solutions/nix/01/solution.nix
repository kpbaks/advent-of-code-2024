{
  system ? "x86_64-linux",
  pkgs ? import <nixpkgs> { inherit system; },
}:
with builtins;
let

  lib = pkgs.lib;
  input = readFile ./inputs/day01.txt;
  # elemAt xs n
  # genList f n
  every = nth: list: map (i: elemAt list i) (genList (i: i * nth) (length list / nth));
  # chunks = n: list: 
  split-whitespace = s: filter (it: it != [ ] && it != "") (split "[[:space:]]+" s);
  left = map lib.toInt (map head (split-whitespace input));
  right = map lib.toInt (map lib.last (split-whitespace input));
  sortAscending = sort (p: q: p < q);
  leftSorted = sortAscending left;
  rightSorted = sortAscending right;
  abs = x: if x < 0 then -x else x;
  sum = foldl' (acc: it: acc + it) 0;
  absdiff = { fst, snd }: abs (fst - snd);
  part1 = sum (map absdiff (lib.zipLists leftSorted rightSorted));

in
# sort (p: q: p < q) [ 5 3 7 ]
{
  inherit left;
}
