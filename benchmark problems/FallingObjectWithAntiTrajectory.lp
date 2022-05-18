timepoint(0..15).
offset(0..10).
height(0..10).

agent(nathan).
object(apple).

fluent(falling(Ob)) :- object(Ob).
fluent(height(Ob,H)) :- object(Ob), height(H).
event(drop(A,Ob)) :- agent(A), object(Ob).
event(hitGround(Ob)) :- object(Ob).

initiates(drop(A,Ob),falling(Ob),T) :- agent(A), object(Ob), timepoint(T).
terminates(hitGround(Ob),falling(Ob),T) :- object(Ob), timepoint(T).
happens(hitGround(Ob),T) :- holds_at(falling(Ob),T),holds_at(height(Ob,0),T), object(Ob), timepoint(T).

happens(drop(nathan,apple),0).
 :- H1!=H2,holds_at(height(Ob,H1),T),holds_at(height(Ob,H2),T), height(H1), height(H2), object(Ob), timepoint(T).
 
trajectory(falling(Ob),T,height(Ob,H2),Off) :- holds_at(height(Ob,H1),T),H2=(H1-Off), offset(Off), object(Ob), height(H1), height(H2), timepoint(T).
anti_trajectory(falling(Ob),T,height(Ob,H),Off) :- holds_at(height(Ob,H),T), offset(Off), object(Ob), height(H1), height(H2), timepoint(T).
 :- {not holds_at(falling(apple),0)}0.
holds_at(height(apple,10),0).
 :- {not released_at(falling(Ob),0)}0, object(Ob).
released_at(height(Ob,H),0) :- object(Ob), height(H).


#show happens/2.
#show holds_at/2.