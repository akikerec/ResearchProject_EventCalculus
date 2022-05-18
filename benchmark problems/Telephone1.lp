timepoint(0..40).
agent(agent1).
agent(agent2).
phone(phone1).
phone(phone2).

fluent(ringing(P1,P2)) :- phone(P1), phone(P2).
fluent(dialTone(P)) :- phone(P).
fluent(busySignal(P)) :- phone(P).
fluent(idle(P)) :- phone(P).
fluent(connected(P1,P2)) :- phone(P1), phone(P2).
fluent(disconnected(P)) :- phone(P).
event(pickUp(A,P)) :- phone(P), agent(A).
event(setDown(A,P)) :- phone(P), agent(A).
event(dial(A,P1,P2)) :- agent(A), phone(P1), phone(P2).


initiates(pickUp(A,P),dialTone(P),T) :- holds_at(idle(P),T), agent(A), phone(P), timepoint(T).
terminates(pickUp(A,P),idle(P),T) :- holds_at(idle(P),T), agent(A), phone(P), timepoint(T).
initiates(setDown(A,P),idle(P),T) :- holds_at(dialTone(P),T), agent(A), phone(P), timepoint(T).
terminates(setDown(A,P),dialTone(P),T) :- holds_at(dialTone(P),T), agent(A), phone(P), timepoint(T).
initiates(dial(A,P1,P2),ringing(P1,P2),T) :- holds_at(dialTone(P1),T),holds_at(idle(P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
terminates(dial(A,P1,P2),dialTone(P1),T) :- holds_at(dialTone(P1),T),holds_at(idle(P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
terminates(dial(A,P1,P2),idle(P2),T) :- holds_at(dialTone(P1),T),holds_at(idle(P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(dial(A,P1,P2),busySignal(P1),T) :- holds_at(dialTone(P1),T),not holds_at(idle(P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
terminates(dial(A,P1,P2),dialTone(P1),T) :- holds_at(dialTone(P1),T),not holds_at(idle(P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(setDown(A,P),idle(P),T) :- holds_at(busySignal(P),T), agent(A), phone(P), timepoint(T).
terminates(setDown(A,P),busySignal(P),T) :- holds_at(busySignal(P),T), agent(A), phone(P), timepoint(T).
initiates(setDown(A,P1),idle(P1),T) :- holds_at(ringing(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(setDown(A,P1),idle(P2),T) :- holds_at(ringing(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
terminates(setDown(A,P1),ringing(P1,P2),T) :- holds_at(ringing(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(pickUp(A,P2),connected(P1,P2),T) :- holds_at(ringing(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
terminates(pickUp(A,P2),ringing(P1,P2),T) :- holds_at(ringing(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(setDown(A,P1),idle(P1),T) :- holds_at(connected(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(setDown(A,P1),disconnected(P2),T) :- holds_at(connected(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
terminates(setDown(A,P1),connected(P1,P2),T) :- holds_at(connected(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(setDown(A,P2),idle(P2),T) :- holds_at(connected(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(setDown(A,P2),disconnected(P1),T) :- holds_at(connected(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
terminates(setDown(A,P2),connected(P1,P2),T) :- holds_at(connected(P1,P2),T), agent(A), phone(P1), phone(P2), timepoint(T).
initiates(setDown(A,P),idle(P),T) :- holds_at(disconnected(P),T), agent(A), phone(P), timepoint(T).
terminates(setDown(A,P),disconnected(P),T) :- holds_at(disconnected(P),T), agent(A), phone(P), timepoint(T).

happens(pickUp(agent1,phone1),0).
happens(dial(agent1,phone1,phone2),8).
happens(pickUp(agent2,phone2),32).
holds_at(idle(P),0) :- phone(P).

 :- {not holds_at(dialTone(P),0)}0, phone(P).
 :- {not holds_at(busySignal(P),0)}0, phone(P).
 :- {not holds_at(ringing(P1,P2),0)}0, phone(P1), phone(P2).
 :- {not holds_at(connected(P1,P2),0)}0, phone(P1), phone(P2).
 :- {not holds_at(disconnected(P),0)}0, phone(P).
 :- {not released_at(ringing(P1,P2),0)}0, phone(P1), phone(P2).
 :- {not released_at(dialTone(P),0)}0, phone(P).
 :- {not released_at(busySignal(P),0)}0,phone(P).
 :- {not released_at(idle(P),0)}0,phone(P).
 :- {not released_at(connected(P1,P2),0)}0, phone(P1), phone(P2).
 :- {not released_at(disconnected(P),0)}0,phone(P).

#show happens/2.
#show holds_at/2.