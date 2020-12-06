-module(other).
-export([main/0]).

main() ->
    map_stuff().

%


%Map-stuff:
map_stuff() ->
    Bob = #{f_name=>'Bob',l_name=>'Smith'},
    io:fwrite('1st name: ~p\n', [maps:get(f_name,Bob)]),
    io:fwrite('2nd name: ~p\n', [maps:values(Bob)]).
%Foor loop kreálása:
for(0,_) ->
    ok;
for(Max,Min) when Max > 0 ->
    io:fwrite("Num : ~p\n",[Max]),
    for(Max - 1, Min).

%Ezt kell meghívni a mainen belül.
sum([]) -> 0;
sum([H|T]) -> H + sum(T).

%Faktoriális báziskritérium
factorial(N) when N == 0 -> 1;
factorial(N) when N > 0 -> N * factorial(N-1).
%Ezt kell meghívni hozzá a main-en belül
find_factorial(X) ->
    Y = factorial(X),
    io:fwrite("Factorial: ~p\n", [Y]).