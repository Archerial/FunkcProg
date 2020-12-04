-module(harmadik).
-export([hossz/1,hossz/2]).
-export([idojaras/1]).


%[
%   12,
%   {bp,20},
%   {eger,13},
%   {debrecen,12}
%]

%C.w("{0}",a);
%print("format string\n", a,b,c...);

idojaras([{V,C} | Varosok]) ->
    io:format("~w városban -w fok van jelenleg~n", [V,C]),
    idojaras(Varosok);
idojaras() ->
    io:format("A jelentes vege", []),
    end_of_procces.

hossz([_ | V]) ->
    1 + hossz(V);
hossz([]) ->
    0.

hossza(L) when is_list(L)->
    hossz(0,L);
hossza(_) ->
    bad_arg.

hossz(DB, [_ | Vege]) ->
    hossz(DB) + 1, Vege);
hossz(DB, []) ->
    DB.
hossz(_,_) ->
    bad_arg.