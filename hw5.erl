-module(hw5).
-export([myremoveduplicates/1, myintersection/2, mylast/1, myreverse/1, myreplaceall/3]).

% 1) myremoveduplicates
% What source did you use? CHATGPT
% Why did you use that source? I didn't know the syntax
% Did using that source benefit you? Yes, I learned the syntax of pattern matching and how to use guards
% Did using that source interfere with your understanding in any way? No
myremoveduplicates(Str) when is_list(Str) -> myremoveduplicates(Str, []).

myremoveduplicates([], Acc) -> lists:reverse(Acc);
myremoveduplicates([H|T], Acc) ->
    case lists:member(H, T) of
        true -> myremoveduplicates(T, Acc);
        false -> myremoveduplicates(T, [H|Acc])
    end.

% 2) myintersection
% What source did you use? CHATGPT
% Why did you use that source? I was still confused on the semicolon
% Did using that source benefit you? Yes, I learned that the semicolon separates pattern matching statements for the same function
% Did using that source interfere with your understanding in any way? No
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
% What source did you use? CHATGPT
% Why did you use that source? I forgot how to do tail reverse
% Did using that source benefit you? Yes, I relearned how to do tail reverse
% Did using that source interfere with your understanding in any way? No
myreverse(List) -> myreverse(List, []).
myreverse([], Acc) -> Acc;
myreverse([H|T], Acc) -> myreverse(T, [H|Acc]).

% 5) myreplaceall
% What source did you use? CHATGPT
% Why did you use that source? I forgot how to pattern match the old element in the list
% Did using that source benefit you? Yes, I learned how to pattern match old element in the list
% Did using that source interfere with your understanding in any way? No
myreplaceall(_, _, []) -> [];
myreplaceall(New, Old, [Old|T]) -> [New | myreplaceall(New, Old, T)];
myreplaceall(New, Old, [H|T]) -> [H | myreplaceall(New, Old, T)].
