-module(fizzbuzz).
-deprecated({up_to, 1}).

-export([to/1,
         up_to/1,
         fizzbuzz/2]).

to(N) ->
    Self = self(),
    Numbers = if N < 0 -> lists:seq(-1, N, -1); true -> lists:seq(1, N) end,
    lists:foreach(fun(M) ->
                          spawn_link(?MODULE, fizzbuzz, [Self, M])
                  end, Numbers),
    wait(abs(N)).

%% @deprecated Please use {@link fizzbuzz:to/1} instead.
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
    if N rem 15 == 0 ->
           io:format("~p fizzbuzz~n", [N]);
       N rem 3 == 0 ->
           io:format("~p fizz~n", [N]);
       N rem 5 == 0 ->
           io:format("~p buzz~n", [N]);
       true ->
           io:format("~p~n", [N])
    end,
    Parent ! done.
