-module(teszt).
-export([add/2, writer/1, lista/1, lista/2]).
-export([more_value/2,convert/1]).
-export([idojaras/1,idojaras/2]).
-export([hossza/1,hossz/1,hossz/2]).
-export([funcase/1]).
-export([covert_length/1]).
-export([compare/2]).
-export([what_grade/1]).
-export([say_hello/1]).
-export([string_stuff/0,name_stuff/2]).
-export([list_stuff/0,lc_stuff/0]).
-export([for/2,summ/1]).
-export([find_factorial/1,factorial/1]).
-export([start/0,say_something/2]).
-export([startPing/0,ping/2,pong/0]).

%%Basic thing
add(A,B) ->
    A + B.

writer(A) ->
    Atom = kutya,
    io:fwrite("~p ~p\n",[A, Atom]).
%%Lista elemeinek összeadása
lista(L) ->
    lista(0,L).

lista(Osszeg, [Elem | Rest]) ->
    lista(Osszeg + Elem,Rest);
lista(Osszeg, []) ->
    Osszeg;
lista(Osszeg,_) ->
    Osszeg.
%%Több érték visszaadása tuple-ben.
more_value(A,B)->
    {A*2,B*2}.
%%Inch to cm, cm to inch átváltás:
convert({D, inch}) ->
    D / 2.54;
convert({D, cm}) ->
    D * 2.54;
convert({D, _}) ->
    D;
convert(_)->
    bad_arg.
%%Időjárásosxd
idojaras(L) when is_list(L) ->
    Osszeg = idojaras(0, L),
    io:format("A jelentes feldolgozas lefutott mind a ~w varosra~n", [Osszeg]);
idojaras(_) ->
    bad_arg.

idojaras(DB, [Eleje | Vege]) when is_list(Eleje) ->
    idojaras(idojaras(DB, Eleje), Vege);
idojaras(DB, [{V, C} | Varosok]) ->
    io:format("~w városban ~w fok van jelenleg~n", [V, C]),
    idojaras(DB + 1, Varosok);
idojaras(DB, [Adat| Varosok]) ->
    io:format("Hibás adat: ~w~n", [Adat]),
    idojaras(DB, Varosok);
idojaras(DB, []) ->
    DB.
%%Lista hosszát adja vissza:
hossz([_ | V]) ->
    1 + hossz(V);
hossz([]) ->
    0.
%%Lista hosszát adja vissza, ellenőrizve:
hossza(L) when is_list(L)->
    hossz(0,L);
hossza(_) ->
    bad_arg.
%%Lista hosszát adja vissza, egy számhoz hozzáadja hány darab van benne
hossz(DB, [_ | Vege]) ->
    hossz((DB) + 1, Vege);
hossz(DB, []) ->
    DB;
hossz(_,_) ->
    bad_arg.
%%Case szerkezet
funcase(L) when is_list(L) ->
    case L of
        [1,2] -> io:fwrite("1,2");
        [3,4] -> io:fwrite("3,4");
        [_,_] -> egyeb
        end;
funcase(_) ->
    bad_arg.
%test2(A) ->
%    case A of
%        1 -> egy;
%        2 -> ketto;
%        _ -> egyeb;
%        end.
%%Cm to inch to cm, with case:
covert_length(Length) ->
    case Length of 
        {centimeter,X} ->
            {inch, X /2.54};
        {inch,X} ->
            {centimeter, X * 2.54}
        end.
%%Compare nem egyenlő
compare(A,B) ->
    %% > < =< => == =/=  and or not xor
    A >= B.
%%Kinda, if-then:
%%zoltan off
preschool() ->
    'Go to preschool'.
kindergarten() ->
    'Go to kindergarten'.
grade_school() ->
    'Go to grade school'.
what_grade(X) ->
    if X < 5 -> preschool();
    X == 5 -> kindergarten();
    X > 5 -> grade_school()
    end.
%%koszones mas nyelveken
say_hello(X) ->
    case X of
        french -> 'Bonjur';
        german -> 'Guten Tag';
        english -> 'Hello';
        magyar -> 'Hanloo';
        _ -> 'nincs is ilyen nyelv mo'
    end.
%%String magic?!?!?!
string_stuff() ->
    Str1 = "Elso string",
    Str2 = "Masodik string",
    io:fwrite("String : ~p ~p\n", [Str1,Str2]),
    Str3 = io_lib:format("It's a ~s and ~s\n",[Str1, Str2]),
    io:fwrite(Str3).
name_stuff(Fn,Ln) ->
    Name = io_lib:format("~p ~p\n",[Fn,Ln]),
    io:fwrite("Hello ~s", [Name]).
%%lista muveletek:
list_stuff() ->
    %%Két lista összeadása:
    List1 = [1,2,3],
    List2 = [4,5,6],
    List3 = List1 ++ List2,
    List3,
    %%Egyik listából másik listát kivonja
    List4 = List3 -- List2,
    List4,
    %%List4 első eleme:
    hd(List4),
    %%List4 maradék elemei:
    tl(List4),
    %%List4-be belerak egy 3-ast, majd az egészet átadja a lista
    List5 = [3|List4],
    List5.
%%Lista műveletk2??!?!
lc_stuff() ->
    %%2-vel megszorozza a List1 elemeit, majd oda adja a List2-nek
    List1 = [1,2,3],
    List2 = [2* N || N <- List1],
    List2,
    %%2-vel osztható számokat adja vissza a List3-ból.
    List3 = [1,2,3,4],
    List4 = [N || N <- List3, N rem 2 == 0],
    List4,
    %%Legmelgebb várost adja vissza
    City_Weather = [{pittsburgh, 50},{'new york', 53},
                    {charlotte,65},{miami, 78}],
    Great_Temp = [{City, Temp} || {City, Temp} <- City_Weather, Temp >= 65],
    Great_Temp.
%Map-stuff:
%map_stuff() ->
%    Bob = #{f_name=>'Bob',l_name=>'Smith'},
%    io:fwrite('1st name: ~p\n', [maps:get(f_name,Bob)]),
%    io:fwrite('2nd name: ~p\n', [maps:values(Bob)]).
%Foor loop kreálása:
for(0,_) ->
    ok;
for(Max,Min) when Max >= Min ->
    io:fwrite("Num : ~p\n",[Min]),
    for(Max, Min+1).
%%summ list:
summ([]) -> 0;
summ([H|T]) -> H + summ(T).
%Faktoriális számítás, erősen rekurzív:)
factorial(N) when N == 0 -> 1;
factorial(N) when N > 0 -> N * factorial(N-1).
%Ezt kell meghívni hozzá a main-en belül
find_factorial(X) ->
    Y = factorial(X),
    io:fwrite("Factorial: ~p\n", [Y]).
%%Konkurens prog, vagy amit akartok.
say_something(What, 0) ->
    done;
say_something(What,Times) ->
    io:format("~p\n", [What]),
    say_something(What, Times - 1).
start() ->
    spawn(teszt,say_something,[hello, 3]),
    spawn(teszt,say_something,[goodbye, 3]).
%%Ping-pong:
ping(0, Pong_ID) ->
    Pong_ID ! finished,
    io:format("Ping finished~n",[]);

ping(N, Pong_ID) ->
    Pong_ID ! {ping, self()},
    receive
        pong ->
            io:format("Ping received pong~n",[])
        end,
        ping(N-1, Pong_ID).
pong() ->
    receive
        finished ->
            io:format("Pong finished~n", []);
        {ping, Ping_ID} ->
            io:format("Pong received ping~n", []),
            Ping_ID ! pong,
            pong()
        end.
startPing() ->
    Pong_ID = spawn(teszt, pong, []),
    spawn(teszt, ping, [5, Pong_ID]).
%%Dist:





    
    
    

    












