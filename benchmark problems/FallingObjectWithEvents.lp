timepoint(0..40).
height(0..35).
offset(1..35).

object(apple).
agent(nathan).


fluent(falling(O)) :- object(O).
fluent(height(O,H)) :- object(O), height(H).

event(drop(A,O)):- agent(A), object(O).
event(hitGround(O)):- object(O).



initiates(drop(A,O),falling(O),T) :- agent(A), object(O), timepoint(T).

releases(drop(A,O),height(O,H),T) :- agent(A), object(O), height(H), timepoint(T).

terminates(hitGround(O),falling(O),T) :- object(O), timepoint(T).

initiates(hitGround(O),height(O,H),T) :- object(O), height(H), holds_at(height(O,H),T), timepoint(T).

happens(hitGround(O),T) :- object(O), holds_at(falling(O),T), holds_at(height(O,0),T), timepoint(T).

happens(drop(nathan,apple),0).

:- holds_at(height(O,H1),T), holds_at(height(O,H2),T), H1!=H2, timepoint(T), object(O), height(H1), height(H2).

trajectory(falling(O),T,height(O,H2),Off) :- holds_at(height(O,H1),T), H2==H1-Off, timepoint(T), object(O), height(H1), height(H2), offset(Off).

:- holds_at(falling(apple),0).

holds_at(height(apple,35),0).

:- released_at(falling(O),0), object(O).

:- released_at(height(O,H),0), object(O), height(H).

#show happens/2.
#show holds_at/2.