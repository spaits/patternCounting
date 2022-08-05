-module(ik).
-export([arraysElement/2, patternInArray/2, patternInArrayTimes/2, fst/1, snd/1]).

fst({A, _}) -> A.

snd({_, B}) -> B.

patternInArrayTimes(T,P) -> 
	PIA = patternInArray(T, P),
	case fst(PIA) of
	 true -> patternInArrayTimes(snd(PIA),P) + 1;
	 false -> 0 end.

patternInArray(T, []) -> {true, T};
patternInArray(T, [X|XS]) -> case fst(patternInArray(snd(arraysElement(T, X)), XS)) of
  true -> {fst(arraysElement(T, X)),  snd(patternInArray(snd(arraysElement(T, X)), XS))};
  false -> {false, T} end.

arraysElement([], _) -> {false, []};
arraysElement([X|XS], C) when X =:= C -> {true, XS};
arraysElement([X|XS], C) -> {fst(arraysElement(XS, C)),[X] ++ snd(arraysElement(XS, C))}.

