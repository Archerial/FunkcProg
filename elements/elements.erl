-module(elements).
-export([call/2]).

-export([double/1,convert/1,convert/2, lista/2, lista/1]).
-export([hossz/1, hossz/2, hossza/1]).
-export([idojaras/2,odijaras/1]).
-export([nonrek/1]).

[1,2,3,4,5,6,7,8,9]

mult(A,B) ->
    A * B.

nonrek() when is_list(L) ->
    [mult(X * X) || X <- L, X > 3];
nonrek(_) ->
    bad_arg.


call(F,D) ->
    F(D).

idojaras(L) when is_list(L) ->
    Osszes = udojaras(0,L),
    io:format("A jelentés feldolgozása lefutott mind a ~w városra ~n").
idojaras(_) ->
    bad_arg.

idojaras(DB, [Eleje | Vege]) when is_list(Eleje) ->
    idojaras(idojaras(DB,Elej), Vege);
idojaras(DB, [{V,C} | Varosok]) ->
    io:format("~w városban ~w fok van jelenleg~n", [V,C]),
    idojaras(DB + 1, Varosok);
idojaras(DB, [Adat | Varosok]) ->
    io:format("Hibás adat: ~w~n",[Adat]),
    idojaras(DB, Varosok);
idojaras(DB, []) ->
    DB.
