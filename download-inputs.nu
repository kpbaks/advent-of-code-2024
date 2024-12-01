const YEAR = 2024

def main [session_cookie?: string] {
    # let now = date now | date to-record

# https://adventofcode.com/2024/day/1/input
    let inputs_dir = "inputs"
    mkdir $inputs_dir

    # let begin_date = "2024-12-01" | into datetime | date to-record
    let begin_date = "2024-12-01"
    # let end_date = "2024-12-25" | into datetime | date to-record

    let today_date = date now | format date "%Y-%m-%d"

    seq date --begin-date $begin_date --end-date $today_date
    # | each { date to-record }
    | each {|date|
        let day = $date | date to-record | get day
        let f = $"($inputs_dir)/day($date | format date "%d").txt"
        if  ($f | path exists) {
            echo "already installed"
        } else {
            let url = $"https://adventofcode.com/2024/day/($day)/input"
            curl --cookie $"session=($session_cookie)" $url | save $f
            # http get --headers [Set-Cookie $"session:($session_cookie)"] $url | save $f
            echo $"downloaded input for day ($day)"
        }
    }
}
