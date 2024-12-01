app [main] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.17.0/lZFLstMUCUvd5bjnnpYromZJXkQUrdhbva4xdBInicE.tar.br" }

import pf.Stdout

import "inputs/day01.txt" as input : Str

ParsedInput : { left : List Int, right : List Int }

zip : List a, List b -> List Pair a b
zip = \fst, snd -> List.map2 fst snd Pair

parse : Str -> ParsedInput
parse = \input ->

    expect List.len left == List.len right

part1 : ParsedInput -> Int
part1 : \input ->

    leftSorted = List.sortAsc input.left
    rightSorted = List.sortAsc input.right

    zip leftSorted rightSorted
    |> 
    
main =
    parsedInput = parse input
    Stdout.line! "part1: $(part1 parsedInput)"
    Stdout.line! "part2: $(part2 parsedInput)"

