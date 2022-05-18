timepoint(0..10).

event(lightOn).
event(close1).
event(open2).
event(closeRelay).

fluent(light).
fluent(switch1).
fluent(switch2).
fluent(switch3).
fluent(relay).

happens(lightOn,T) :- stopped(light,T),initiated(switch1,T),initiated(switch2,T), timepoint(T).
happens(open2,T) :- started(switch2,T),initiated(relay,T), timepoint(T).
happens(closeRelay,T) :- stopped(relay,T),initiated(switch1,T),initiated(switch3,T), timepoint(T).
initiates(lightOn,light,T) :- timepoint(T).
terminates(open2,switch2,T) :- timepoint(T).
initiates(closeRelay,relay,T) :-  timepoint(T).
initiates(close1,switch1,T) :- timepoint(T).
 :- {not released_at(light,0)}0.
 :- {not released_at(switch1,0)}0.
 :- {not released_at(switch2,0)}0.
 :- {not released_at(switch3,0)}0.
 :- {not released_at(relay,0)}0.
 :- {not holds_at(switch1,0)}0.
holds_at(switch2,0).
holds_at(switch3,0).
 :- {not holds_at(relay,0)}0.
 :- {not holds_at(light,0)}0.
happens(close1,12).

#show happens/2.
#show holds_at/2.
