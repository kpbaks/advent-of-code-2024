{
  pkgs ? import <nixpkgs> { },
}:
let
  scriptName = "download-inputs";
in
pkgs.writers.writeNuBin scriptName { }
  # nu
  ''
    		# TODO: add a --force flag
            def main [session_cookie?: string] {
        		let session_cookie = if $session_cookie != null {
        			$session_cookie
        		} else if $env.ADVENT_OF_CODE_SESSION? != null {
        			$env.ADVENT_OF_CODE_SESSION
        		} else {
        			error make {msg: "No session cookie given. Either pass it as `${scriptName} <cookie>` or set environment variable ADVENT_OF_CODE_SESSION"}
        		}
        	
                let inputs_dir = "inputs"
                mkdir $inputs_dir

                # let begin_date = "2024-12-01" | into datetime | date to-record
                let begin_date = "2024-12-01"
                # let end_date = "2024-12-25" | into datetime | date to-record
                let today_date = date now | format date "%Y-%m-%d"

                let dates = seq date --begin-date $begin_date --end-date $today_date

                for date in $dates {
                    let day = $date | date to-record | get day
                    let f = $"($inputs_dir)/day($date | format date "%d").txt"
                    if  ($f | path exists) {
                        print $"day (ansi blue)($day)(ansi reset) already installed"
                    } else {
                        let url = $"https://adventofcode.com/2024/day/($day)/input"
                        ${pkgs.curl}/bin/curl --cookie $"session=($session_cookie)" $url | save $f
                        # FIXME: figure out why this does not work
                        # http get --headers [Set-Cookie $"session:($session_cookie)"] $url | save $f
                        print $"downloaded input for day (ansi yellow)($day)(ansi reset)"
                    }
                }
            }
  ''
