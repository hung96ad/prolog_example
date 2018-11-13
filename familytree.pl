:- discontiguous male/1, female/1, parent/2.
male(long).
male(dung).
male(tung).
male(tien).
male(toan).

female(hoa).
female(thuy).
female(tam).
female(thu).

parent(long,thuy).
parent(long,dung).
parent(thuy,tung).
parent(dung,tam).

marital(hoa,long).
marital(tien,thuy).
marital(thu,dung).

parent(X,Y) :- marital(X,Somebody),parent(Somebody,Y).

father(X,Y) :- male(X),parent(X,Y).
mother(X,Y) :- female(X),parent(X,Y).

grandfather(X,Y) :- father(X,Somebody),parent(Somebody,Y).
grandmother(X,Y) :- female(X),marital(X,Somebody),grandfather(Somebody,Y).

son(X,Y) :- male(X),parent(Y,X).
daughter(X,Y) :- female(X),parent(Y,X).

sister(X,Y) :- female(X),parent(Par,X),parent(Par,Y), X \= Y.
brother(X,Y) :-  male(X),parent(Somebody,X),parent(Somebody,Y), X \= Y.

sister_in_law(X,Y) :- marital(X,Husband),brother(Husband,Y).
brother_in_law(X,Y) :- marital(X,Wife),sister(Wife,Y).

uncle(X,Y) :- (brother(X,Par);brother_in_law(X,Par)),parent(Par,Y).
aunt(X,Y) :- (sister(X,Par),siter_in_law(X,Par)),parent(Par,Y).

cousin(X,Y) :- uncle(Unc , X),father(Unc,Y).

