timepoint (0..15).
place(work).
place(home).

station (herneHill).
station(victoria).
station(southKen).

fluent(at(P)) :- place(P).
fluent(train(S, S1)) :- station(S), station(S1).

event(walkTo(P)) :- place(P).
event(trainTo(S)) :- station(S).
event(goToWork).

initiates(walkTo(P),at(P),T) :- place(P), timepoint(T).
terminates(walkTo(P2),at(P1),T) :- P1!=P2,holds_at(at(P1),T), place(P1), place(P2), timepoint(T).
initiates(trainTo(S2),at(S2),T) :- holds_at(train(S1,S2),T),holds_at(at(S1),T), station(S1), station(S2), timepoint(T).
terminates(trainTo(S2),at(S1),T) :- holds_at(train(S1,S2),T),holds_at(at(S1),T), station(S1), station(S2), timepoint(T).
initiates(goToWork,at(work),T) :- timepoint(T).
terminates(goToWork,at(P1),T) :- holds_at(at(P1),T),P1!=work, place(P1), timepoint(T).
happens3(goToWork,T1,T4) :- happens3(walkTo(herneHill),T1,T1),happens3(trainTo(victoria),T2,T2),happens3(trainTo(southKen),T3,T3),happens3(walkTo(work),T4,T4),T1<T2,T2<T3,T3<T4,not clipped(T1,at(herneHill),T2),not clipped(T2,at(victoria),T3),not clipped(T3,at(southKen),T4), timepoint(T1), timepoint(T2), timepoint(T3), timepoint(T4).
holds_at(train(herneHill,victoria),T) :- timepoint(T).
holds_at(train(victoria,southKen),T) :- timepoint(T).
 :- {not released_at(at(P),0)}0, place(P).
 :- {not released_at(train(S1,S2),0)}0,station(S1), station(S2).
 :- P1!=P2,holds_at(at(P1),T),holds_at(at(P2),T), place(P1), place(P2), timepoint(T).
 :- S1=S2,holds_at(train(S1,S2),T), station(S1), station(S2), timepoint(T).
 :- {not holds_at(train(S1,S2),T)}0,S1!=herneHill,S1!=victoria, station(S1), station(S2), timepoint(T).
 :- {not holds_at(train(S1,S2),T)}0,S2!=victoria,S2!=southKen, station(S1), station(S2), timepoint(T).
happens3(trainTo(southKen),10,10).
happens3(walkTo(work),12,12).

:- S2=southKen,holds_at(train(S1,S2),T),S1=herneHill, station(S1), station(S2), timepoint(T).
holds_at(at(home),0).
happens3(walkTo(herneHill),1,1).
happens3(trainTo(victoria),6,6).


#show holds_at/2.
#show happens/2.
#show happens3/3.