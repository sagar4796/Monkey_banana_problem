move([door,window, computer, onfloor, no], walk(door, middle), [middle,
window, computer,onfloor, no]).
move([door,window, computer, onfloor, no], walk(door, window), [window,
window, computer,onfloor, no]).
move([door,window, computer, onfloor, no], walk(door, computer), [computer,
window, computer,onfloor, no]).
move([middle,window, computer, onfloor, no], walk(middle,window), [window,
window, computer, onfloor, no]).
move([middle,window, computer, onfloor, no], walk(middle,computer),
[computer, window, computer, onfloor, no]).
move([middle,middle, computer, onfloor, no], walk(middle,computer),
[computer, middle, computer, onfloor, no]).
move([middle,window, middle, onfloor, no], walk(middle,window), [window,
window, middle, onfloor, no]).
move([window,window, computer, onfloor, no], push(window, middle), [middle,
middle, computer, onfloor, no]).
move([computer,window, computer, onfloor, no], push(computer, middle),
[middle, window, middle, onfloor, no]).
move([computer,middle, computer, onfloor, no], push(computer, middle),
[middle, middle, middle, onfloor, no]).
move([window,window, middle, onfloor, no], push(window, middle), [middle,
middle, middle, onfloor, no]).
move([middle, middle, middle, onfloor, no], climb(box1), [middle, middle,
middle,onbox1, no]).
move([middle, middle, middle, onbox1, no], climb(box2), [middle, middle,
middle,onbox2, no]).
move([middle, middle, middle, onbox2, no], grab(banana), [middle, middle,
middle,onbox2, yes]).
path(N, N, _, [N],[N]).
path(Start, Finish, Visited, [Start|Path],[Action|P]) :-
 move(Start,Action, X), not(member(X, Visited)), path(X, Finish, [X|Visited], Path,
P).


% sample query (path([door,window, computer, onfloor, no],[middle, middle, middle,onbox2, yes],[],State,Plan).)