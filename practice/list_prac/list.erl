-module(list).
-export([main/0]).

main() ->
    lc_stuff().


list_stuff() ->
    List1 = [1,2,3],
    List2 = [4,5,6],
    List3 = List1 ++ List2,
    List3,
    List4 = List3 -- List2,
    List4,
    hd(List4),
    tl(List4),
    List5 = [3|List4],
    List5,
    [Head|Tail] = List5,
    Head.

lc_stuff() ->
    List1 = [1,2,3],
    List2 = [2*N || N <- List1],
    List2,

    List3 = [1,2,3,4],
    List4 = [N || N <- List3, N rem 2 == 0],
    List4,

    City_Weather = [{pittsburgh, 50},{'new york', 53},
                    {charlotte,65},{miami, 78}],
    Great_Temp = [{City, Temp} || {City, Temp} <- City_Weather, Temp >= 65],
    Great_Temp.

