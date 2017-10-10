-module(fizzbuzz).

-export([up_to/1,
         fizzbuzz/2]).

up_to(N) ->
    Self = self(),
    lists:foreach(fun(M) ->
                          spawn_link(?MODULE, fizzbuzz, [Self, M])
                  end, lists:seq(1, N)),
    wait(N).

wait(0) ->
    ok;
wait(N) ->
    receive 
        done ->
            wait(N - 1);
        _ ->
            wait(N)
    end.

fizzbuzz(Parent, N) ->
    if N rem 3 == 0 ->
           io:format("~p fizz~n", [N]);
       N rem 5 == 0 ->
           io:format("~p buzz~n", [N]);
       true ->
           io:format("~p~n", [N])
    end,
    Parent ! done.
