
% (DEC1)
stopped_in(T1,F,T4) :- timepoint(T),
                       timepoint(T1),
                       timepoint(T2),
					   timepoint(T3),
					   timepoint(T4),
                       fluent(F),
                       event(E),
                       happens3(E,T2,T3),
                       T1<T3,
                       T2<T4,
                       terminates(E,F,T2).

% (DEC2)
started_in(T1,F,T4) :- timepoint(T),
                       timepoint(T1),
                       timepoint(T2),
					   timepoint(T3),
					   timepoint(T4),
                       fluent(F),
                       event(E),
                       happens3(E,T2,T3),
                       T1<T3,
                       T2<T4,
                       initiates(E,F,T2).

% (DEC3)
holds_at(F2,T2+T3) :- timepoint(T1),
                      timepoint(T2),
					  timepoint(T3),
                      fluent(F1),
                      fluent(F2),
                      event(E),
                      happens3(E,T1,T2),
                      initiates(E,F1,T1),
                      0<T3,
                      trajectory(F1,T1,F2,T3),
                      not stopped_in(T1,F1,T2+T3).

% (DEC4)
holds_at(F2,T2+T3) :- timepoint(T1),
                      timepoint(T2),
					  timepoint(T3),
                      fluent(F1),
                      fluent(F2),
                      event(E),
                      happens3(E,T1, T2),
                      terminates(E,F1,T1),
                      0<T3,
                      anti_trajectory(F1,T1,F2,T3),
                      not started_in(T1,F1,T1+T3).
					  
%new rules

released_at_between(T1,F,T2) :- released_at(F,T), 
								timepoint(T),
								timepoint(T1),
								timepoint(T2),
								fluent(F),
								T1<T, T<=T2.
								  
persists_between(T1,F,T2) :- not released_at_between(T1,F,T2),
							 timepoint(T),
							 timepoint(T1),
							 timepoint(T2),
							 fluent(F).
							 
released_between(T1,F,T4) :- happens3(E,T2,T3),
							 releases(E,F,T2),
							 timepoint(T1),
							 timepoint(T2),
							 timepoint(T3),
							 timepoint(T4),
							 fluent(F),
							 event(E),
							 T1<=T3, T2<T4.
							 
%new rules
							 
							 	
initiated(T1,F,T4) :- timepoint(T1), timepoint(T2), timepoint(T3), timepoint(T4),
                  fluent(F),
                  event(E),
                  happens3(E,T2,T3), T1<=T3, T2<T4,
                  initiates(E,F,T2).

terminated(T1,F,T4) :- timepoint(T1), timepoint(T2), timepoint(T3), timepoint(T4),
                   fluent(F),
                   event(E),
                   happens3(E,T2,T3), T1<=T3, T2<T4,
                   terminates(E,F,T2).

% (DEC5)
holds_at(F,T2) :-  timepoint(T1),
				   timepoint(T2),
                   fluent(F),
                   holds_at(F,T1),
                   T1<T2,
				   persists_between(T1,F,T2),
                   not terminated(T1,F,T2).

% (DEC6)
:- timepoint(T1), timepoint(T2), fluent(F), not holds_at(F,T1), 
	T1<T2, persists_between(T1,F,T2), holds_at(F,T2),
	not released_at(F,T2), not initiated(T1,F,T2).

% (DEC7)
released_at(F,T2) :- timepoint(T1), timepoint(T2),
                      fluent(F),
                      released_at(F,T1),
					  T1<T2,
					  not initiated(T1,F,T2),
                      not terminated(T1,F,T2).

% (DEC8)
:- not released_at(F,T1), timepoint(T1), timepoint(T2),
	fluent(F), T1<T2, not released_between(T1,F,T2),
	released_at(F,T2).
	
%new rule

released_in(T1,F,T4) :- timepoint(T1), timepoint(T2), timepoint(T3),
						timepoint(T4), fluent(F), event(E),
						happens3(E,T2,T3), T1<T3, T2<T4, releases(E,F,T2).

%	
	

% (DEC9)
holds_at(F,T3) :- timepoint(T1), timepoint(T2), timepoint(T3),
                   fluent(F), event(E), happens3(E,T1,T2),
                   initiates(E,F,T1), T2<T3, not stopped_in(T1,F,T3),
				   not released_in(T1,F,T3).

% (DEC10)
:- timepoint(T1), timepoint(T2), timepoint(T3), fluent(F), event(E),
	happens3(E,T1,T2), terminates(E,F,T1), T2<T3, not started_in(T1,F,T3),
	not released_in(T1,F,T3), holds_at(F,T3).

% (DEC11)
released_at(F,T3) :- timepoint(T1), timepoint(T2), timepoint(T3),
                      fluent(F), event(E), 
                      happens3(E,T1,T2), releases(E,F,T1), T2<T3,
					  not stopped_in(T1,F,T3), not started_in(T1,F,T3).

% (DEC12)
:- timepoint(T1), timepoint(T2), timepoint(T3), event(E), fluent(F),
	happens3(E,T1,T2), initiates(E,F,T1), T2<T3, not released_in(T1,F,T3),
	released_at(F,T3).
	

:- timepoint(T1), timepoint(T2), event(E), happens3(E,T1,T2), T1>T2.


happens(E,T) :- happens3(E,T,T).


