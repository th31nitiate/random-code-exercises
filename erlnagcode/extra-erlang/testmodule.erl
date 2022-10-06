%%%-------------------------------------------------------------------
%%% @author m3rl1n
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Jun 2022 01:24
%%%-------------------------------------------------------------------
-module(testmodule).
-author("m3rl1n").

%% API
-export([pie/0,pie/2,print/1,either_or_both/2, area/1, new_error_funcation/0,error_funcation/0]).

%% Records
-record(customer, {name="<anonymous>", address, phone}).

%% Macros
-define(PI, 3.14).
-define(pair(X, Y), {X, Y}).

pie() ->
  3.14.

pie(Address, Phone) ->
  R = #customer{name="MyNewSystem", address = Address, phone = Phone},
  R#customer.name.

print(Term) ->
  io:format("The value of Term is: ~w.~n", [Term]).

% This should be equivalent of or statement
either_or_both(true, A) when is_boolean(A) ->
  true;
either_or_both(B, true) when is_boolean(B) ->
  true;
either_or_both(false, false) ->
  false.

area({circle, Radius})  when is_integer(Radius)->
  Radius * Radius * math:pi();
area({square, Side}) when is_integer(Side) ->
  Side * Side;
area({rectangle, Height, Width}) when is_integer(Height) and is_integer(Width) ->
  Height * Width.

area_via_case(Shape) ->
  case Shape of
    {circle, Radius} ->
      Radius * Radius * math:pi();
    {square, Side} ->
      Side * Side;
    {rectangle, Height, Width} ->
      Height * Width
  end.

either_or_both_via_case(A,B) ->
  case {A,B} of
    {true, B} when is_boolean(B) ->
      true;
    {A, true} when is_boolean(A) ->
      true;
    {false, false} ->
      false
  end.

alternate_either_or_both(X,Y) ->
  case either_or_both(X, Y) of % here what we do is use the funcation to return either true or false.
    true -> io:format("yes~n");
    false -> io:format("no~n")
  end.

sign(N) when is_number(N) ->
  if
    N > 0 -> positive;
    N < 0 -> negative;
    true -> zero
  end.

some_error() ->
  2 div 0.


exit_funcation() ->
  throw("Testing throw funcation~n").

error_funcation() ->
  try
    exit_funcation()
  catch
    oops -> got_throw_opps;
    throw:Other -> {got_throw, Other};
    exit:Reason -> {got_exit, Reason};
    error:Reason -> {got_error, Reason}
  end.

new_error_funcation() ->
  try
    some_error()
  of
    0 -> io:format("nothing to do~n");
    N -> io:format(N)
  catch
    _:_ ->
      %io:format("Some problem~n");
      erlang:get_stacktrace()
  end.

circumference(Radius) -> Radius * 2 * ?PI.
pair_of_pairs(A, B, C, D) -> ?pair(?pair(A, B), ?pair(C, D)).

Pid = spawn(fun() -> do_something() end);



-ifdef(DEBUG).
-define(show(X), io:format("The value of X is: ~w,~n", [X])).
-else.
-define(show(X), ok).
-endif.

fo(A) ->
  ?show(A).