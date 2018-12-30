:- consult('globalVariable.pro').

establishCryptoProblemParameters :-
  declare(low, 0),
  declare(high, 15).
:- establishCryptoProblemParameters.

generateRandomCryptoNumber(Number) :-
  valueOf(low, Low),
  valueOf(high, High),
  Range is High + 1,
  random(Low, Range, Number).

generateRandomCryptoProblem :-
  generateRandomCryptoNumber(N1),
  generateRandomCryptoNumber(N2),
  generateRandomCryptoNumber(N3),
  generateRandomCryptoNumber(N4),
  generateRandomCryptoNumber(N5),
  generateRandomCryptoNumber(Goal),
  addCryptoProblemToKnowledgeBase(N1,N2,N3,N4,N5,Goal).

addCryptoProblemToKnowledgeBase(N1,N2,N3,N4,N5,Goal) :-
  retract(problem(_,_)),
  assert(problem(numbers(N1,N2,N3,N4,N5),goal(Goal))).

addCryptoProblemToKnowledgeBase(N1,N2,N3,N4,N5,Goal) :-
  assert(problem(numbers(N1,N2,N3,N4,N5),goal(Goal))).

displayProblem :-
  problem(numbers(N1,N2,N3,N4,N5),goal(Goal)),
  write('Numbers = {'),
  write(N1),write(,),
  write(N2),write(,),
  write(N3),write(,),
  write(N4),write(,),
  write(N5),write(,),
  write('} Goal ='),
  write(Goal),
  nl.

demo :-
  generateRandomCryptoProblem,  
  displayProblem.

generateOne :-
  generateRandomCryptoProblem,
  displayProblem.

generateN(1) :-
  generateOne.

generateN(N) :-
  generateOne,
  Recurse is N - 1,
  generate(Recurse).
