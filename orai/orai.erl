
-module(orai).
-export([test/1]).
-export([convert_length/1, test2/1]).

test2(A) ->
    case A of
        1 -> egy;
        2 -> ketto;
        _ -> egyeb;
        end.

convert_length(Length) ->
    case Length of
        {centimeter, X} ->
            {inch, X/2.54};
        {inch, Y} ->
            {centimeter, Y*2.54}
    end. 

test(A) ->
    if
        A == 1 ->
            io:format("~w egyenlo egy", [A]);
        A > 1 ->
            io:format("~w nagyobb egy", [A]);
        A < 1 ->
            io:format("~w kisebb egy", [A]);
    end,

 lefutott.
            
