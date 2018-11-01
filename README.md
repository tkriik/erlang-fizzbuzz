# erlang-fizzbuzz

Concurrent non-deterministic fizzbuzz implementation in Erlang.


## usage

Launch the Erlang shell:

`$ erl`

Compile the fizzbuzz module:

`> c(fizzbuzz).`

Run fizzbuzz computation either from 1 up to any positive integer N or from -1 to any negative integer N:

```
> fizzbuzz:to(15).
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
11
12 fizz
13
14
15 fizzbuzz
```

```
> fizzbuzz:to(-15).
-1
-2
-3 fizz
-4
-5 buzz
-6 fizz
-7
-8
-9 fizz
-10 buzz
-11
-12 fizz
-13
-14
-15 fizzbuzz
```
