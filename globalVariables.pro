%% A utility file for the crypto problem solver
%% This file represents the basic functionality of operations
%%   and provides a way to allow global variables in Prolog

declare(Variable,Value) :-
  retract(binding(Variable,_)),
  assert(binding(Variable,Value)).
declare(Variable,Value) :-
  assert(binding(Variable,Value)).

bind(Variable,Value) :-
  retract(binding(Variable,_)),
  assert(binding(Variable,Value)).

valueOf(Variable,Value) :-
  binding(Variable,Value).

undeclare(Var) :-
  retract(binding(Var,_)).

displayBindings :-
  binding(Variable,Value),
  write(Variable),
  write(' -> '),
  write(Value),
  nl,
  fail.
displayBindings.

increment(Variable) :-
  retract(binding(Variable, Value)),
  NewValue is Value + 1,
  assert(binding(Variable, NewValue)).

decrement(Variable) :-
  retract(binding(Variable, Value)),
  NewValue is Value - 1,
  assert(binding(Variable, NewValue)).

add(Variable,Number) :-
  retract(binding(Variable, Value)),
  NewValue is Value + Number,
  assert(binding(Variable,NewValue)).

subtract(Variable,Number) :-
  retract(binding(Variable, Value)),
  NewValue is Value - Number,
  assert(binding(Variable, NewValue)).

multiply(Variable,Number) :-
  retract(binding(Variable, Value)),
  NewValue is Value * Number,
  assert(binding(Variable, NewValue)).

divide(Variable,Number) :-
  retract(binding(Variable,Value)),
  NewValue is Value / Number,
  assert(binding(Variable,NewValue)).

power(Variable1,Variable2,Result) :-
  binding(Variable1,Base),
  binding(Variable2,Power),
  Returner is Base ** Power,
  assert(binding(Result,Returner)).
