
let input = open inputs/day01.txt
| lines
| parse "{left}   {right}"
| update left { into int }
| update right { into int }


def part1 [ ]: table<left: int, right: int> -> int {
	let left = $in.left | sort
	let right = $in.right | sort

	$left | zip $right | each {$in.0 - $in.1 | math abs} | math sum
}

def part2 [ ]: table<left: int, right: int> -> int {
	let h = $in.right | histogram

	$in.left | each { |l|
		let entry = $h | where value == $l
		if ($entry | is-empty) {
			0
		} else {
			let entry = $entry.0
			$entry.value * $entry.count
		}
	}
	| math sum
}


echo $"(ansi blue)part1:(ansi reset) ($input | part1)
(ansi blue)part2:(ansi reset) ($input | part2)
"
