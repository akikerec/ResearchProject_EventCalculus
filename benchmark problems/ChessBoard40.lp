timepoint(0..40).
offset(1..1).



fluent(itsBlack).
fluent(itsWhite).
fluent(onBlack).
fluent(onWhite).

event(throw).



initiates(throw,onWhite,T) :- holds_at(itsWhite,T), timepoint(T).

initiates(throw,onBlack,T) :- holds_at(itsBlack,T), timepoint(T).

holds_at(itsWhite,T); holds_at(itsBlack,T) :- timepoint(T).

releasedAt(itsBlack,T):- timepoint(T).

releasedAt(itsWhite,T):- timepoint(T).

:- releasedAt(onBlack,0).

:- releasedAt(onWhite,0).

:- holds_at(onWhite,0).

:- holds_at(onBlack,0).

happens(throw,15).

holds_at(itsWhite,0).

holds_at(itsBlack,0).

holds_at(itsWhite,40).

holds_at(itsBlack,40).



#show holds_at/2. 
#show happens/2.
