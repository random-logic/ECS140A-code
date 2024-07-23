% 1
% What source did you use? ChatGPT
% Why did you use that source? I didnt know the syntax
% Did using that source benefit you? Yes, I learned the syntax
% Did using that source interfere with your understanding in any way? No
% Base cases
shuffle([], [], []).
shuffle(L1, [], L1).
shuffle([], L2, L2).

% Recursive case
shuffle([H1|T1], [H2|T2], [H1,H2|T3]) :- shuffle(T1, T2, T3).

% 2
% What source did you use? ChatGPT
% Why did you use that source? I didnt know how to do recursion
% Did using that source benefit you? Yes, I learned how to do recursion
% Did using that source interfere with your understanding in any way? No
% Base case
double([], []).

% Recursive case
double([H1|T1], [H1,H1|T2]) :- double(T1, T2).

% 3
% What source did you use? ChatGPT
% Why did you use that source? I didnt know how to detect if an element is a member of a list
% Did using that source benefit you? Yes, I learned how to detect if an element is a member of a list
% Did using that source interfere with your understanding in any way? No
% Base case
no_duplicates([], []).

% Recursive case: when the head of L1 is not in the tail of L1, it should be included in L2
no_duplicates([H|T], [H|NT]) :-
  \+ member(H, T),
  no_duplicates(T, NT).

% Recursive case: when the head of L1 is in the tail of L1, it should not be included in L2
no_duplicates([H|T], NT) :-
  member(H, T),
  no_duplicates(T, NT).

% 4
% What source did you use? ChatGPT
% Why did you use that source? I didnt know how to sort the lists to check if they are the same
% Did using that source benefit you? Yes, I learned how to sort the lists to check if they are the same
% Did using that source interfere with your understanding in any way? No
same_elements(L1, L2) :-
  msort(L1, SortedL1),
  msort(L2, SortedL2),
  SortedL1 = SortedL2.
