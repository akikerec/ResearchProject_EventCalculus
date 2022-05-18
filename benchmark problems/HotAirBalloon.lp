timepoint(0..10).
height(0..6).
offset(1..6).
agent(nathan).
balloon(ba).

fluent(heaterOn(B)) :- balloon(B).
fluent(height(B,H)) :-  balloon(B), height(H).
event(turnOnHeater(A,B)) :- agent(A), balloon(B).
event(turnOffHeater(A,B)) :- agent(A), balloon(B).

initiates(turnOnHeater(A,B),heaterOn(B),T) :- agent(A), balloon(B), timepoint(T).
terminates(turnOffHeater(A,B),heaterOn(B),T) :- agent(A), balloon(B), timepoint(T).
happens(turnOnHeater(nathan,ba),1).
happens(turnOffHeater(nathan,ba),6).

 :- H1!=H2,holds_at(height(B,H1),T),holds_at(height(B,H2),T), balloon(B), height(H1), height(H2), timepoint(T).
trajectory(heaterOn(B),T,height(B,H2),Off) :- holds_at(height(B,H1),T),H2=(H1+Off), height(H1), height(H2), balloon(B), timepoint(T), offset(Off).
antiTrajectory(heaterOn(B),T,height(B,H2),Off) :- holds_at(height(B,H1),T),H2=(H1-Off), height(H1), height(H2), balloon(B), timepoint(T), offset(Off).
holds_at(height(ba,0),0).
 :- {not holds_at(heaterOn(ba),0)}0.
released_at(height(B,H),T) :- balloon(B), height(H), timepoint(T).
 :- {not released_at(heaterOn(B),0)}0, balloon(B).
 
#show happens/2.
#show holds_at/2.

