-module(prac).

-export([hello_world/0,add/2,add/3,main/0,do_math/2]).

main() ->
    string_stuff().

hello_world() ->
    io:fwrite("Hello world\n").

add(A,B) ->
    hello_world(),
    A + B.

add(A,B,C) ->
    hello_world(),
    A + B + C.

do_math(A, B) ->
    A + B.

compare(A,B) ->
    A =/= B.

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

say_hello(X) ->
    case X of
        french -> 'Bonjur';
        german -> 'Guten Tag';
        english -> 'Hello'
    end.

string_stuff() ->
    Str1 = "Ranom string",
    Str2 = "Another string",
    io:fwrite("String : ~p ~p\n", [Str1,Str2]),
    Str3 = io_lib:format("It's a ~s and ~s\n",[Str1, Str2]),
    io:fwrite(Str3).



