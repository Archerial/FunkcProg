-module(tesztcaller).
-export([call/2]).

call(A,B) ->
    teszt:add(A,B).