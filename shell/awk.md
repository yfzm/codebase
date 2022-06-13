# AWK

|Variable name|Description|
|-|-|
|`FS`	 |field separator (default space)|
|`NF`	 |# of fields in the current record|
|`NR`	 |current record/line number|
|`$0` |	whole line|
|`$n` |	n-th field|
|`FNR`	 |current record number in the current file|
|`RS`	 |input record separator (default newline)|
|`OFS`	 |output field separator (default blank)|
|`ORS`	 |output record separator (default newline)|
|`OFMT`	 |output format for numbers (default %.6g)|
|`SUBSEP`	 |separates multiple subscripts (default 034)|
|`ARGC`	 |argument count|
|`ARGV`	 |array of arguments|
|`FILENAME`	 |the name of the current input file|
|`RSTART`	 |index of the start of the matching pattern|
|`RLENGTH`	 |the length of the string matched by the match function|
|`CONVFMT`	 |conversion format used when converting numbers (default %.6g)|


```awk
# This program implements `wc`

{
    words += NF
    chars += length + 1 # include newline character
}

END {
    print NR, words, chars
}
```

```awk
# This program finds all palindromes in the file.

{
    if (length($0) == 1) {next}

    rev = reverse($0)

    if (length($0) > 1 && $0 == rev) {
        print $0
        n++
    }
}

END {
    printf "There are %d palindromes\n", n
}

function reverse(word) {
    r = ""
    for (i=length(word); i!=0; i--) {
        r = r substr(word, i, 1)
    }
    return r
}
```

```awk
# This program creates a rock-paper-scissors game.

BEGIN {

    srand()

    opts[1] = "rock"
    opts[2] = "paper"
    opts[3] = "scissors"

    do {

        print "1 - rock"
        print "2 - paper"
        print "3 - scissors"
        print "9 - end game"

        ret = getline < "-"

        if (ret == 0 || ret == -1) {
            exit
        }

        val = $0

        if (val == 9) {
            exit
        } else if (val != 1 && val != 2 && val != 3) {
            print "Invalid option"
            continue
        } else {
            play_game(val)
        }

    } while (1)
}

function play_game(val) {

    r = int(rand()*3) + 1

    print "I have " opts[r] " you have "  opts[val]

    if (val == r) {
        print "Tie, next throw"
        return
    }

    if (val == 1 && r == 2) {
        print "Paper covers rock, you loose"
    } else if (val == 2 && r == 1) {
        print "Paper covers rock, you win"
    } else if (val == 2 && r == 3) {
        print "Scissors cut paper, you loose"
    } else if (val == 3 && r == 2) {
        print "Scissors cut paper, you win"
    } else if (val == 3 && r == 1) {
        print "Rock blunts scissors, you loose"
    } else if (val == 1 && r == 3) {
        print "Rock blunts scissors, you win"
    }
}
```
