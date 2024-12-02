app [main] { pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.17.0/lZFLstMUCUvd5bjnnpYromZJXkQUrdhbva4xdBInicE.tar.br" }

import pf.Stdout
# import Num.Int

import "../../../inputs/day02.txt" as inputDay2 : Str

exampleInput =
    """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

Level : I32
Report : List Level

# A : [Bool Bool]

parseReport : Str -> Report
parseReport = \line ->
    line
    |> Str.splitOn " "
    |> List.keepOks Str.toI32

expect parseReport "1 2 3 4 5" == [1, 2, 3, 4, 5]
expect parseReport "8 6 4 4 1" == [8, 6, 4, 4, 1]

parse : Str -> Result (List Report) _
parse = \input ->
    input
    |> Str.trimEnd
    |> Str.splitOn "\n"
    |> List.map parseReport
    |> Ok

# |> \x -> Ok x

part1 : List Report -> I32
part1 = \report -> 0

expect
    reports = parse exampleInput
    part1 reports == [1, 2, 3, 4, 5, 6, 7, 8, 9]

part2 : List Report -> I32
part2 = \report -> 0

main =
    when parse inputDay2 is
        Ok report ->
            Stdout.line! "part1: $(Num.toStr (part1 report))"
            Stdout.line! "part2: $(Num.toStr (part2 report))"

        Err err ->
            Stdout.line! "Error: $(err)"

# expect (parse exampleInput) == Ok [1, 2, 3, 4, 5, 6, 7, 8, 9]
