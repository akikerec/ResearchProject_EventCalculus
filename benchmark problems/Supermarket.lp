timepoint(0..40).



fluent(forwards).
fluent(backwards).
fluent(spinning).

event(push).
event(pull).



initiates(push,forwards,T) :- not happens(pull,T), timepoint(T).

terminates(push,backwards,T) :- not happens(pull,T), timepoint(T).

initiates(pull,backwards,T) :- not happens(push,T), timepoint(T).

terminates(pull,forwards,T) :- not happens(push,T), timepoint(T).

initiates(pull,spinning,T) :- happens(push,T), timepoint(T).

terminates(pull,forwards,T) :- happens(push,T), timepoint(T).

terminates(pull,backwards,T) :- happens(push,T), timepoint(T).

terminates(push,spinning,T) :- not happens(pull,T), timepoint(T).

terminates(pull,spinning,T) :- not happens(push,T), timepoint(T).

:- released_at(forwards,0).

:- released_at(backwards,0).

:- released_at(spinning,0).

:- holds_at(forwards,0).

:- holds_at(backwards,0).

:- holds_at(spinning,0).

happens(push,15).

happens(pull,15).

happens(pull,35).

happens(push,35).

#show holds_at/2. 
#show happens/2.
