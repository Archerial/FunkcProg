-module(tupel_prac).
-export([main/0]).

main() ->
    tuple_stuff().

tuple_stuff() ->
    My_Data = {42,165,5.43},
    My_Data,
    {A,B,C} = My_Data,
    C,
    {D,_,_} = My_Data,
    D,
    My_Data2 = {height,6.25},
    {height, Ht} = My_Data2,
    Ht.
    