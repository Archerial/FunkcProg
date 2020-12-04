-module(hw).
-export([convert/1]).

convert({T, km}) ->
    T * 0.621371192237;
convert({T, miles}) ->
    T * 1.609344;
convert({T, _}) ->
    T;
convert(_) ->
    bad_paramter.
