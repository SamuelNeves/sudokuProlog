% Modulo usado para realizar algumas operações
use_module(library(lists)).
% Authors: Samuel Neves 13.1.8422
%          Tainara Camila 12.1.8344
% Tutorial para jogar.
% O jogo se trata de um Sudoku classico, onde nao podem haver repetições dos digitos
% de 1 a 9 nas linhas, colunas e dentro dos quadrados menores.
% Para começar a jogar insira um nivel de dificuldade de 1 a 4.
% O tabuleiro é dividido em 9 "celulas" que representam as quadrados de tamanho 3x3.
% Os mesmos estão enumerados da forma abaixo:
            % 1    2   3
            % 4    5   6
            % 7    8   9
% Assim caso voce deseje alterar um número dentro do qudrado 3x3 do centro, deverá indicar a celula 5.
% O primeiro passo para realizar uma alteração no tabuleiro é inserir a celula  em que deseja fazer a alteração,
% em seguida voce deve inserir a posição dentro da celula tb de 1 a 9, e por fim o valor que deseja alterar.
% Caso voce  consiga preencher todas os valores do tabuleiro com valores diferentes de 0, seguindo as regras do sudoku,
% o jogo  se encerara  e voce será declarado como vencedor.
%

% Digite startGame para  começar o game.



inicio:-startGame.
begin:-startGame.
comecar:-startGame.

startGame :-
    nl,
    write('********************'), nl,
	  write('Welcome to Sudoku 0.01'), nl,nl,
	  write('********************'), nl,
    write('Authors: Samuel Neves- 13.1.8422'),nl,
    write('         Tainara Camila- 12.1.8344'),nl,nl,nl,nl,
    write('Please insert a difficult to start the game:'),nl,
    write('1-Very Easy'),nl,
    write('2-Easy'),nl,
    write('3-Medium'),nl,
    write('4-Hard'),nl,
    read(Difficult),
    startBoard(Difficult,Board),showBoard(Board),game(Board).


%Clausula que recebe um estado do jogo e modifica este estado e o salva em NewBoard apos o jogo;
% nth1 realiza a insercao
play(Board,NewBoard):-write('Insert the Cell: 1-9 '),nl,
  readCorrect(Cposition),nl
  ,write('Insert the positon that you want to replace: 1-9 ')
  ,nl,readCorrect(P),write('Insert the number:'),nl,
  readCorrect(Number),nl,nl,nl,
  nth1(Cposition,Board,Cel),PC is P-1,
  replace(Cel,PC,Number,CNew),nl,CCposition is Cposition-1,replace(Board,CCposition,CNew,NewBoard).

% Jogo em si caso o usuario ganhe é finalizado
% abaixo é utilizado o corte '!'
game(Board):-checkBoard(Board),!,write('Congratulations!! You Win!'),nl.
game(Board):-play(Board,NewBoard),showBoard(NewBoard),game(NewBoard).


% Exibe tabuleito
 showBoard([Cell1,Cell2,Cell3,Cell4,Cell5,
 Cell6,Cell7, Cell8, Cell9]):-
    nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,nl,
    printFirstLineOfCell(Cell1),printFirstLineOfCell(Cell2),printFirstLineOfCell(Cell3),nl,
    printSecondLineOfCell(Cell1),printSecondLineOfCell(Cell2),printSecondLineOfCell(Cell3),nl,
    printThirdLineOfCell(Cell1),printThirdLineOfCell(Cell2),printThirdLineOfCell(Cell3),nl,
    nl,
    printFirstLineOfCell(Cell4),printFirstLineOfCell(Cell5),printFirstLineOfCell(Cell6),nl,
    printSecondLineOfCell(Cell4),printSecondLineOfCell(Cell5),printSecondLineOfCell(Cell6),nl,
    printThirdLineOfCell(Cell4),printThirdLineOfCell(Cell5),printThirdLineOfCell(Cell6),nl,
    nl,
    printFirstLineOfCell(Cell7),printFirstLineOfCell(Cell8),printFirstLineOfCell(Cell9),nl,
    printSecondLineOfCell(Cell7),printSecondLineOfCell(Cell8),printSecondLineOfCell(Cell9),nl,
    printThirdLineOfCell(Cell7),printThirdLineOfCell(Cell8),printThirdLineOfCell(Cell9),nl,nl.


% Clausulas auxiliares para exibição do tabuleiro
printFirstLineOfCell([E1,E2,E3,_,_,_,_,_,_]):-showLineCell([E1,E2,E3]) .
printSecondLineOfCell([_,_,_,E1,E2,E3,_,_,_]):- showLineCell([E1,E2,E3]).
printThirdLineOfCell([_,_,_,_,_,_,E1,E2,E3]):-showLineCell([E1,E2,E3]).


showLineCell([
LC1,
LC2,
LC3
]):-
   write(LC1),
    write(' '), write(LC2),
    write(' '), write(LC3),
    write('  ').

% Nivel Babies
startBoard(1,X):- X=[
[
5,9,1,
8,6,2,
7,3,4
  ],[
4,6,2,
7,3,1,
8,9,5
  ],[
7,8,3,
5,4,9,
6,1,2
  ],[
3,2,5,
1,7,8,
9,4,6
  ],[
1,8,9,
6,2,4,
3,5,7
  ],[
4,6,7,
9,3,5,
8,2,1
  ],[
4,8,7,
6,1,9,
2,5,3
  ],[
5,1,3,
2,7,8,
9,4,6
  ],[
2,9,6,
3,5,4,
0,7,8
  ]
].

% Nivel Easy
startBoard(2,X):- X=[
[
5,9,1,
8,6,2,
7,3,4
  ],[
4,6,2,
7,3,1,
8,9,5
  ],[
7,8,3,
5,4,9,
6,1,2
  ],[
3,2,5,
1,7,8,
9,4,6
  ],[
1,8,9,
6,2,4,
3,5,7
  ],[
4,6,7,
9,3,5,
8,2,1
  ],[
4,8,7,
6,1,9,
2,5,3
  ],[
5,1,3,
2,7,8,
9,4,6
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ]
].

% Nivel Medium
startBoard(3,X):- X=[
[
5,9,1,
8,6,2,
7,3,4
  ],[
4,6,2,
7,3,1,
8,9,5
  ],[
7,8,3,
5,4,9,
6,1,2
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
1,8,9,
6,2,4,
3,5,7
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
4,8,7,
6,1,9,
2,5,3
  ],[
5,1,3,
2,7,8,
9,4,6
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ]
].
% Nivel Hard
startBoard(4,X):- X=[
[
0,0,0,
0,0,0,
0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ],[
  0,0,0,
  0,0,0,
  0,0,0
  ]
].

% check if all members of a list are diferents
all_diff(L) :- \+ (select(X,L,R), memberchk(X,R)).

% Verifica o tabuleiro  caso  as celulas estejam corretas
checkBoard(Board):-  checkZerosinCells(Board),checkCells(Board),checkAllLines(Board),checkAllColumns(Board).


checkZerosinCells([C1,C2,C3,C4,C5,C6,C7,C8,C9]):-
  notMember(0,C1),notMember(0,C2),notMember(0,C3),notMember(0,C4),notMember(0,C5),
  notMember(0,C6),notMember(0,C7),notMember(0,C8),notMember(0,C9).


checkAllLines([C1,C2,C3,C4,C5,C6,C7,C8,C9]):-
    checkFirstLine([C1,C2,C3]),checkSecondLine([C1,C2,C3]),checkThirdLine([C1,C2,C3]),
    checkFirstLine([C4,C5,C6]),checkSecondLine([C4,C5,C6]),checkThirdLine([C4,C5,C6]),
    checkFirstLine([C7,C8,C9]),checkSecondLine([C7,C8,C9]),checkThirdLine([C7,C8,C9]).

checkFirstLine([
  [C1E1,C1E2,C1E3,_,_,_,_,_,_],
  [C2E1,C2E2,C2E3,_,_,_,_,_,_],
  [C3E1,C3E2,C3E3,_,_,_,_,_,_]
  ]):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkSecondLine([
  [_,_,_,C1E1,C1E2,C1E3,_,_,_],
  [_,_,_,C2E1,C2E2,C2E3,_,_,_],
  [_,_,_,C3E1,C3E2,C3E3,_,_,_]
  ]):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkThirdLine([
  [_,_,_,_,_,_,C1E1,C1E2,C1E3],
  [_,_,_,_,_,_,C2E1,C2E2,C2E3],
  [_,_,_,_,_,_,C3E1,C3E2,C3E3]
  ]):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkAllColumns([C1,C2,C3,C4,C5,C6,C7,C8,C9]):-
    checkFirstColumn([C1,C4,C7]),checkSecondColumn([C1,C4,C7]),checkThirdColumn([C1,C4,C7]),
    checkFirstColumn([C2,C5,C8]),checkSecondColumn([C2,C5,C8]),checkThirdColumn([C2,C5,C8]),
    checkFirstColumn([C3,C6,C9]),checkSecondColumn([C3,C6,C9]),checkThirdColumn([C3,C6,C9]).

checkFirstColumn([
  [C1E1,_,_,C1E2,_,_,C1E3,_,_],
  [C2E1,_,_,C2E2,_,_,C2E3,_,_],
  [C3E1,_,_,C3E2,_,_,C3E3,_,_]]
  ):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkSecondColumn([
  [_,C1E1,_,_,C1E2,_,_,C1E3,_],
  [_,C2E1,_,_,C2E2,_,_,C2E3,_],
  [_,C3E1,_,_,C3E2,_,_,C3E3,_]]
  ):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).

checkThirdColumn([
  [_,_,C1E1,_,_,C1E2,_,_,C1E3],
  [_,_,C2E1,_,_,C2E2,_,_,C2E3],
  [_,_,C3E1,_,_,C3E2,_,_,C3E3]]
  ):-all_diff([C1E1,C1E2,C1E3,C2E1,C2E2,C2E3,C3E1,C3E2,C3E3]).




checkCells([C1,C2,C3,C4,C5,C6,C7,C8,C9]):-
  all_diff(C1);
  all_diff(C2),
  all_diff(C3),
  all_diff(C4),
  all_diff(C5),
  all_diff(C6),
  all_diff(C7),
  all_diff(C8),
  all_diff(C9).

%Troca  um elemnto com base no indice
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.
replace(L, _, _, L).

% Verifica se uma lista nao contem um dado elemento

% Outra forma de verificar se um elemento pertence a lista.
% notMember(Arg,[Arg|_]) :-
%         !,
%         fail.
% notMember(Arg,[_|Tail]) :-
%         !,
%         notMember(Arg,Tail).
% notMember(_,[]).

notMember(X,List):- \+ (memberchk(X,List)).

% verifica se a entrada esta entre 1 e 9
readCorrect(Number):-read(N),correctInput(Number,N).
correctInput(Number,N):-memberchk(N,[1,2,3,4,5,6,7,8,9]),!,Number is N.
correctInput(Number,_):-
    nl,write('Invalid Input! Please insert a number between 1 and 9.'),
    readCorrect(Number).
