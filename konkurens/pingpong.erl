-module(pingpong).
-export([startPing/0,ping/2,pong/0]).

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
    Pong_ID = spawn(pingpong, pong, []),
    spawn(pingpong, ping, [3, Pong_ID]).

