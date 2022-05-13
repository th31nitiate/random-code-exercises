-module(recursive).
-compile(export_all).

fac(N) when N == 0 ->
    1;
fac(N) when N > 0 ->
    N*fac(N-1).


len([]) ->
    0;
len([_|T]) ->
    1 + len(T).

duplicate(0,_) ->
    [];
duplicate(N,Term) when N > 0 ->
    [Term|duplicate(N-1,Term)].

tail_duplicate(N,Term) ->
    tail_duplicate(N,Term,[]).

tail_duplicate(0, _,List) ->
    List;
tail_duplicate(N,Term,List) when N > 0 ->
    tail_duplicate(N-1, Term, [Term,List]).

reverse([]) ->
    [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) ->
     tail_reverse(L,[]).

tail_reverse([],Acc) ->
    Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

sublist(_,0) ->
    [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].


tail_sublist(L, N) ->
     reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, SubList) ->
    SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
    tail_sublist(T, N-1, [H|SubList]).

zip([],[]) ->
    [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

lenient_zip([],_) ->
    [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].

tail_zip(X,Y) ->
    reverse(tail_zip(X,Y,[])).

tail_zip([],[],Acc) ->
    Acc;
tail_zip([X|Xs],[Y|Ys], Acc) ->
    tail_zip(Xs,Ys, [{X,Y}|Acc]).

tail_lenient_zip(X,Y) ->
    reverse(tail_lenient_zip(X,Y,[])).

tail_lenient_zip([],_,Acc) ->
    Acc;
tail_lenient_zip(_,[],Acc) -> Acc;
tail_lenient_zip([X|Xs],[Y|Ys],Acc) ->
    tail_lenient_zip(Xs,Ys, [{X,Y}|Acc]).


partition(_,[], Smaller, Larger) ->
    {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot ->
            partition(Pivot, T, [H|Smaller], Larger);
       H > Pivot ->
            partition(Pivot, T, Smaller, [H|Larger])
    end.


lc_quicksort([]) ->
    [];
lc_quicksort([Pivot|Rest]) ->
    lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
    ++ [Pivot] ++
    lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).

