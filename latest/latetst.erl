

-export([nonrek/1]).



mult(A,B) ->
    A * B.

nonrek(L) when is_list(L) ->
    [mult(X,X) || X <- L, X > 3, X < 8];
nonrek(_) ->
    bad_arg.

call(F,D) ->
    F(D).


convert() ->
    D;
convert(_) ->
    bad_parameter.
