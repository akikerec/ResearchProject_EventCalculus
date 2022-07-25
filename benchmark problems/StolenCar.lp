timepoint(0..40).



fluent(carParked).

event(park).
event(steal).



initiates(park,carParked,T) :- timepoint(T).

terminates(steal,carParked,T) :- timepoint(T).

:- released_at(carParked,0).

:- holds_at(carParked,0).

:- holds_at(carParked,40).

:- holds_at(carParked,T), happens(park,T), timepoint(T).

holds_at(carParked,T) :- happens(steal,T), timepoint(T).

:- happens(steal,T1), T1<T2, happens(park,T2), timepoint(T1), timepoint(T2).

0{happens(E, T)}1 :- timepoint(T), event(E), T<40.



#show holds_at/2.
#show happens/2.
