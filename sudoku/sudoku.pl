use_module(library(lists)).
teste(L):-L = [[1,2,3,4],[2,3,4],[2,2,2]].


checkPos(Ind,X):-teste(L),nth1(Ind,L,X).

startGame :-
    nl,
    write('********************'), nl,
	  write('Sudoku'), nl,
	  write('********************'), nl,startBoard(Board),showBoard(Board),game(Board).



play(Board,NewBoard):-write('Insert the Cell: 1-9'),nl,
read(Cposition),write('Insert the positon that you want to replace: 1-9 ')
,nl,read(P),write('Insert the number:'),nl,
read(Number),nl,nl,nl,
nth1(Cposition,Board,Cel),PC is P-1,
replace(Cel,PC,Number,CNew),nl,CCposition is Cposition-1,replace(Board,CCposition,CNew,NewBoard).

% game(Board):-checkBoard(Board),!,write('Parabens Voce Ganhou!'),nl.
game(Board):-play(Board,NewBoard),showBoard(NewBoard),game(NewBoard).



 showBoard([
 Cell1,
 Cell2,
 Cell3,
 Cell4,
 Cell5,
 Cell6,
 Cell7,
 Cell8,
 Cell9
]
):- write('||'), printFirstLineOfCell(Cell1),write(' '),printFirstLineOfCell(Cell2),write(' '),printFirstLineOfCell(Cell3),nl,
    write('||'),printSecondLineOfCell(Cell1),write(' '),printSecondLineOfCell(Cell2),write(' '),printSecondLineOfCell(Cell3),nl,
    write('||'),printThirdLineOfCell(Cell1),write(' '),printThirdLineOfCell(Cell2),write(' '),printThirdLineOfCell(Cell3),nl,
    write('-----------------------------------------------------'),nl,
    write('||'),printFirstLineOfCell(Cell4),write(' '),printFirstLineOfCell(Cell5),write(' '),printFirstLineOfCell(Cell6),nl,
    write('||'),printSecondLineOfCell(Cell4),write(' '),printSecondLineOfCell(Cell5),write(' '),printSecondLineOfCell(Cell6),nl,
    write('||'),printThirdLineOfCell(Cell4),write(' '),printThirdLineOfCell(Cell5),write(' '),printThirdLineOfCell(Cell6),nl,
    write('-----------------------------------------------------'),nl,
    write('||'),printFirstLineOfCell(Cell7),write(' '),printFirstLineOfCell(Cell8),write(' '),printFirstLineOfCell(Cell9),nl,
    write('||'),printSecondLineOfCell(Cell7),write(' '),printSecondLineOfCell(Cell8),write(' '),printSecondLineOfCell(Cell9),nl,
    write('||'),printThirdLineOfCell(Cell7),write(' '),printThirdLineOfCell(Cell8),write(' '),printThirdLineOfCell(Cell9),nl.



printFirstLineOfCell([E1,E2,E3,_,_,_,_,_,_]):-showLineCell([E1,E2,E3]) .
printSecondLineOfCell([_,_,_,E1,E2,E3,_,_,_]):- showLineCell([E1,E2,E3]).
printThirdLineOfCell([_,_,_,_,_,_,E1,E2,E3]):-showLineCell([E1,E2,E3]).


showLineCell([
LC1,
LC2,
LC3
]):-
   write(LC1),
    write(' | '), write(LC2),
    write(' | '), write(LC3),
    write(' |||').

startBoard(X):-X=
[
Y,
Y,
Y,
Y,
Y,
Y,
Y,
Y,
Y
],Y=[0,0,0,0,0,0,0,0,0].

% check if all members of a list are diferents
all_diff(L) :- \+ (select(X,L,R), memberchk(X,R)).



checkBoard(Board):- checkCells(Board),checkAllLines(Board),checkAllColumnsColums(Board).


checkAllLines(
[
C1,
C2,
C3,
C4,
C5,
C6,
C7,
C8,
C9
]):-checkFirstLine([C1,C2,C3]),checkSecondLine([C1,C2,C3]),checkThirdLine([C1,C2,C3]),
    checkFirstLine([C4,C5,C6]),checkSecondLine([C4,C5,C6]),checkThirdLine([C4,C5,C6]),
    checkFirstLine([C7,C8,C9]),checkSecondLine([C7,C8,C9]),checkThirdLine([C7,C8,C9]).

checkFirstLine(
[C1E1,C1E2,C1E3,_,_,_,_,_,_],
[C2E1,C2E2,C2E3,_,_,_,_,_,_],
[C3E1,C3E2,C3E3,_,_,_,_,_,_]
):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkSecondLine(
[_,_,_,C1E1,C1E2,C1E3,_,_,_],
[_,_,_,C2E1,C2E2,C2E3,_,_,_],
[_,_,_,C3E1,C3E2,C3E3,_,_,_]
):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkThirdLine(
[_,_,_,_,_,_,C1E1,C1E2,C1E3],
[_,_,_,_,_,_,C2E1,C2E2,C2E3],
[_,_,_,_,_,_,C3E1,C3E2,C3E3]
):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkAllColumns(
[
C1,
C2,
C3,
C4,
C5,
C6,
C7,
C8,
C9
]):-checkFirstColumn([C1,C4,C7]),checkSecondColumn([C1,C4,C7]),checkThirdColumn([C1,C4,C7]),
    checkFirstColumn([C2,C5,C8]),checkSecondColumn([C2,C5,C8]),checkThirdColumn([C2,C5,C8]),
    checkFirstColumn([C3,C6,C9]),checkSecondColumn([C3,C6,C9]),checkThirdColumn([C3,C6,C9]).

checkFirstColumn(
[C1E1,_,_,C1E2,_,_,C1E3,_,_],
[C2E1,_,_,C2E2,_,_,C2E3,_,_],
[C3E1,_,_,C3E2,_,_,C3E3,_,_]
):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkSecondColumn(
[_,C1E1,_,_,C1E2,_,_,C1E3,_],
[_,C2E1,_,_,C2E2,_,_,C2E3,_],
[_,C3E1,_,_,C3E2,_,_,C3E3,_]
):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkThirdColumn(
[_,_,C1E1,_,_,C1E2,_,_,C1E3],
[_,_,C2E1,_,_,C2E2,_,_,C2E3],
[_,_,C3E1,_,_,C3E2,_,_,C3E3]
):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).




checkCells(
[
C1,
C2,
C3,
C4,
C5,
C6,
C7,
C8,
C9
]):-all_diff(C1),
all_diff(C2),
all_diff(C3),
all_diff(C4),
all_diff(C5),
all_diff(C6),
all_diff(C7),
all_diff(C8),
all_diff(C9).

%
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).
