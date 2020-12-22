# Branch `b`
https://www.gnu.org/software/sed/manual/html_node/Branching-and-flow-control.html

```sh
seq 3 | sed b
```

## `n`
> the `n` commands first prints the content of the pattern space, empties the pattern space then reads the next input line.
```sh
seq 3 | sed ':x ; n ; bx'
```

## `N`
> the `N` commands appends the next input line to the pattern space (with a newline). Lines are accumulated in the pattern space until there are no more input lines to read, then the N command terminates the sed program. When the program terminates, the end-of-cycle actions are performed, and the entire pattern space is printed.
```sh
seq 3 | sed ':x ; N ; bx'
```

```sh
printf '%s\n' aa bb cc dd | sed ':x ; n ; = ; bx'
printf '%s\n' aa bb cc dd | sed ':x ; N ; = ; bx'
printf '%s\n' aa bb cc dd | sed ':x ; n ; s/\n/***/ ; bx'
printf '%s\n' aa bb cc dd | sed ':x ; N ; s/\n/***/ ; bx'
```
