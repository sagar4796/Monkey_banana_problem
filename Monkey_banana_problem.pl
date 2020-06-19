move(state(middle, onbox2, middle, middle, put, hasnot),
 grap,
 state(middle, onbox2, middle, middle, put, has)).
move(state(M, onfloor, M, M, no,H),
 put(box2, box1),
 state(M,onfloor, M, M, put, H)).
move(state(P, onfloor, P, B, A, H),
 climb1,
 state(P, onbox1, P, B,A, H)).
move(state(P, onbox1, P, P,A, H),
 climb2,
 state(P, onbox2, P, P,A, H)).
move(state(P1, onfloor, P, P1,A, H),
 push2(P1, P2),
 state(P2, onfloor, P, P2,A, H)).
move(state(P1, onfloor, P1, B,A, H),
 push1(P1, P2),
 state(P2, onfloor, P2, B,A, H)).
%move(state(P1, onfloor, P2, B, H),
% walk(P1, P2),
% state(P2, onfloor, P2, B, H)).
move(state(P1, onfloor, P2, B,A, H),
 walk(P1, P2),
 state(P2, onfloor, P2, B,A, H)).
move(state(P1, onfloor, P, P2,A, H),
 walk(P1, P2),
 state(P2, onfloor, P, P2,A, H)).
add(X,L,[X|L]).
canget(state(_, _, _,_,_, has)).
canget(State1) :- move(State1, _, State2), canget(State2).
canget(state(_, _, _,_,_, has), []).
canget(State1, Plan) :-
 move(State1, Action, State2),
 canget(State2, PartialPlan),
 add(Action, PartialPlan, Plan).