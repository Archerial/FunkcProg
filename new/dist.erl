-module(dist).
-export([start/0, sendAsync/2, send/2]).

start() ->
    register(server,spawn(fun() -> loop() end)).



%%register(test, spawn(fun() -> loop() end)).

%% Async function
sendAsync(Pid, M) ->
    Pid ! M.

%% Sync Function
send(Pid, Message) ->
    Pid ! {self(),Message},
    receive
        {server ,Reply} -> {server,Reply};
        Other -> {error, Other}
    end.

loop() ->
    receive
        {Pid, hello} -> Pid ! {server, hello}, loop();
        {Pid, stop} -> Pid ! {server, stop};
        {Pid, {F,P}} -> Pid ! {server, F(P)}, loop();
        {Pid, V} -> Pid ! {server, V};
        _ ->loop()
    end.




%%{Pid, hello} -> {server, hello}
%%{Pid, stop} -> {server,stop} %stops the server
%%{Pid, {fun(X) -> X + 2 end, 10}} -> {server, F(P)}
