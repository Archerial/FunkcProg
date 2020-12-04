-module(elements).
-export([double/1, convert/1, convert/2, lista/2, lista/1]).

lista(L) ->
    lista(0,L).

lista(Osszeg, [Elem | Rest]) ->
    lista(Osszeg + Elem,Rest);
lista(Osszeg, []) ->
    Osszeg;
lista(Osszeg,_) ->
    Osszeg.


convert(A,B) ->
    {A * 2, B* 2}.

double(X) -> 
    X * 2.

%%convert(D::integer(), atom()) ->  real() | error:error()


convert({D, inch}) ->
    D / 2.54;
convert({D, cm}) ->
    D * 2.54;
convert({D, _}) ->
    D;
convert(_)->
    bad_parameter.

%%HF: átváltás km és miles között
