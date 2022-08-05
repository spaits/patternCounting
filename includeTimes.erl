-module(includeTimes).
-export([arraysElement/2, patternInArray/2, patternInArrayTimes/2]).

patternInArrayTimes(T,P) -> 
	{FOUND, REM} = patternInArray(T, P),
	case FOUND of
	 true -> patternInArrayTimes(REM, P) + 1;
	 false -> 0 end.

patternInArray(T, []) -> {true, T};
patternInArray(T, [X|XS]) ->
	{INIT, WOIT} = arraysElement(T, X),
	{FOUND, REM} = patternInArray(WOIT, XS),
	case FOUND of
	 true -> {INIT,  REM};
	 false -> {false, T} end.

arraysElement([], _) -> {false, []};
arraysElement([X|XS], C) when X =:= C -> {true, XS};
arraysElement([X|XS], C) -> 
	{FOUND, REM} = arraysElement(XS, C),
	{FOUND, [X] ++ REM}.
