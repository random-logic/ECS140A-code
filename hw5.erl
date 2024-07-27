-module(hw5).
-export([myremoveduplicates/1, myintersection/2, mylast/1, myreverse/1, myreplaceall/3]).

% 1) myremoveduplicates
myremoveduplicates(Str) when is_list(Str) -> myremoveduplicates(Str, []).

myremoveduplicates([], Acc) -> lists:reverse(Acc);
myremoveduplicates([H|T], Acc) ->
    case lists:member(H, T) of
        true -> myremoveduplicates(T, Acc);
        false -> myremoveduplicates(T, [H|Acc])
    end.

% 2) myintersection
myintersection(List1, List2) -> myintersection(List1, List2, []).

myintersection([], _, Acc) -> lists:reverse(Acc);
myintersection([H|T], List2, Acc) ->
    case lists:member(H, List2) of
        true -> myintersection(T, List2, [H|Acc]);
        false -> myintersection(T, List2, Acc)
    end.

% 3) mylast
mylast([]) -> [];
mylast([H]) -> [H];
mylast([_|T]) -> mylast(T).

% 4) myreverse
myreverse(List) -> myreverse(List, []).

myreverse([], Acc) -> Acc;
myreverse([H|T], Acc) -> myreverse(T, [H|Acc]).

% 5) myreplaceall
myreplaceall(_, _, []) -> [];
myreplaceall(New, Old, [Old|T]) -> [New | myreplaceall(Old, New, T)];
myreplaceall(New, Old, [H|T]) -> [H | myreplaceall(Old, New, T)].
