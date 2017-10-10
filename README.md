# erlang-fizzbuzz

Concurrent non-deterministic fizzbuzz implementation in Erlang.


## usage

Launch the Erlang shell:

`$ erl`

Compile the fizzbuzz module:

`> c(fizzbuzz).`

Run fizzbuzz computation from 1 up to any positive integer N:

```
> fizzbuzz:up_to(10).
1
2
3 fizz
4
5 buzz
6 fizz
7
8
9 fizz
10 buzz
```
