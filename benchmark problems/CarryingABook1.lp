timepoint(0..10).

event(walk(A,R1,R2)) :- agent(A), room(R1), room(R2).
event(pickUp(A,O)) :- agent(A), object(O).
event(letGoOff(A,O)) :- agent(A), object(O).

fluent(inRoom(A,R)) :- agent(A), room(R).
fluent(inRoom(O,R)) :- object(O), room(R).
fluent(holding(A,O)) :- agent(A), object(O).

agent(nathan).
object(book).
room(room1).
room(room2).


initiates(walk(A,R1,R2), inRoom(A,R2),T) :- agent(A), room(R1), room(R2), timepoint(T).
terminates(walk(A,R1,R2), inRoom(A,R1),T) :- agent(A), room(R1), room(R2), timepoint(T), R1!=R2.

:- holds_at(inRoom(O,R1),T), holds_at(inRoom(O,R2),T), R1!=R2.

initiates(pickUp(A,O), holding(A,O), T) :- holds_at(inRoom(A,R),T), holds_at(inRoom(O,R), T), agent(A), object(O), room(R), timepoint(T).
terminates(letGoOff(A,O), holding(A,O), T) :- holds_at(holding(A,O), T), agent(A), object(O), timepoint(T).

initiates(walk(A,R1,R2), inRoom(O,R2), T) :- holds_at(holding(A,O), T), agent(A), object(O), room(R1), room(R2), timepoint(T).
terminates(walk(A,R1,R2), inRoom(O,R1), T) :- holds_at(holding(A,O), T), agent(A), object(O), room(R1), room(R2), timepoint(T), R1!=R2.

:-released_at(F,T), fluent(F), timepoint(T).
holds_at(inRoom(nathan, room1),0).
holds_at(inRoom(book, room1), 0).

happens(pickUp(nathan,book),1).
happens(walk(nathan,room1,room2),2).

#show holds_at/2.
#show happens/2.