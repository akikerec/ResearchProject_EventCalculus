timepoint(0..10).

event(run(A,L)) :- agent(A), location(L).
event(drive(A,L)) :- agent(A), location(L).
event(go(A,L)) :- agent(A), location(L).

fluent(tired(A)) :- agent(A).

agent(nathan).
location(bookstore).

happens(run(A,L),T) ; happens(drive(A,L),T) :- happens(go(A,L),T).

initiates(run(A,L), tired(A), T) :- agent(A), location(L), timepoint(T).

:- released_at(F,T), fluent(F), timepoint(T).
:- holds_at(tired(nathan), 0).
happens(go(nathan, bookstore), 0).
holds_at(tired(nathan),1).

#show holds_at/2.
#show happens/2.