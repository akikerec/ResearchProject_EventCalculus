timepoint(0..20).

event(setAlarmTime(A,C,T)) :- agent(A), clock(C), timepoint(T).
event(turnOnAlarm(A,C)) :- agent(A), clock(C).
event(turnOffAlarm(A,C)) :- agent(A), clock(C).
event(startbeeping(C)) :- clock(C).

fluent(alarmTime(C,T)) :- clock(C), timepoint(T).
fluent(alarmOn(C)) :- clock(C).
fluent(beeping(C)) :- clock(C).

agent(nathan).
clock(clock).

initiates(setAlarmTime(A,C,T2), alarmTime(C,T2), T) :- holds_at(alarmTime(C,T1),T), T1!=T2, agent(A), clock(C), timepoint(T), timepoint(T2), timepoint(T1).
terminates(setAlarmTime(A,C,T2), alarmTime(C,T1), T) :- holds_at(alarmTime(C,T1), T), T1!=T2, agent(A), clock(C), timepoint(T), timepoint(T1), timepoint(T2).

initiates(turnOnAlarm(A,C), alarmOn(C), T) :- agent(A), clock(C), timepoint(T).
terminates(turnOffAlarm(A,C), alarmOn(C), T) :- agent(A), clock(C), timepoint(T).
initiates(startbeeping(C), beeping(C), T) :- clock(C), timepoint(T).
terminates(turnOffAlarm(A,C), beeping(C), T) :- agent(A), clock(C), timepoint(T).

:- holds_at(alarmTime(C,T1),T), holds_at(alarmTime(C,T2),T), T1!=T2.

happens(startbeeping(C),T) :- holds_at(alarmTime(C,T),T), holds_at(alarmOn(C),T), clock(C), timepoint(T).

:- holds_at(alarmOn(clock),0).
:- holds_at(beeping(clock),0).
holds_at(alarmTime(clock,10),0).
:-released_at(F,T), fluent(F), timepoint(T).

happens(setAlarmTime(nathan,clock,2),0).
happens(turnOnAlarm(nathan,clock),1).

#show happens/2.
#show holds_at/2.