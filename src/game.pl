:-use_module(library(random)).
:-use_module(library(lists)).

:- consult('board.pl'). % Assuming 'board.pl' contains your board definition


/*
 
* * * * * * * * * * FUNCTIONS TO DEVELOP * * * * * * * * * * 

initialState(+GameState)

displayGame(+GameState)

move(+GameState, +Move, -NewGameState)

gameOver(+GameState, -Winner)

validMoves(+GameState, -Moves)

evaluateBoard(+State, -Value)

chooseMove(+GameState, +Level, -Move)

 */


game_loop(CurrentPlayer) :-
    display_board, % Display the current game board
    nl, write('Player '), write(CurrentPlayer), write("'s turn."), nl,
    get_player_move(CurrentPlayer, Row, Column), % Get the player's move
    (valid_move(CurrentPlayer, Row, Column) -> % Check if the move is valid
        place_piece(Row, Column, CurrentPlayer), % Update the game board
        (player_wins(CurrentPlayer) -> % Check if the player wins
            display_board,
            write('Player '), write(CurrentPlayer), write(' wins! Game over.'), nl
        ;
            % Switch to the other player and continue the game
            switch_player(CurrentPlayer, NextPlayer),
            game_loop(NextPlayer)
        )
    ;
        write('Invalid move. Try again.'), nl,
        game_loop(CurrentPlayer) % Stay on the same player's turn
    ).

% Define a predicate to get the player's move (row and column)
get_player_move(Player, Row, Column) :-
    repeat,
    write('Enter the row (1-8) and column (1-8) where you want to place your piece (e.g., "3 5"): '),
    read(RowInput),
    read(ColumnInput),
    valid_input(RowInput, ColumnInput, Row, Column, Player),
    !. % Cut operator (!) to stop the repeat loop

% Define a predicate to validate the input
valid_input(RowInput, ColumnInput, Row, Column, Player) :-
    integer(RowInput),
    integer(ColumnInput),
    between(1, 8, RowInput), % Validate row input (1-8)
    between(1, 8, ColumnInput), % Validate column input (1-8)
    Row is RowInput - 1, % Adjust for 0-based indexing
    Column is ColumnInput - 1, % Adjust for 0-based indexing
    valid_move(Player, Row, Column). % Check if the move is valid based on game rules


% Define a predicate to switch players
switch_player(playerA, playerB).
switch_player(playerB, playerA).

% Define the win condition check (you need to implement this)
%player_wins(Player) :- 

% Define a basic valid_move predicate for placing a piece in an empty cell
valid_move(Player, Row, Column) :-
    board(Board),
    nth0(Row, Board, RowList),
    nth0(Column, RowList, empty),
    player(Player).





% Predicate to find the first player piece on the defined edges of the board.
find_edge_piece(Player, Board, Position) :-
    find_first_column_piece(Player, Board, Position); % Check the first column.
    find_last_row_piece(Player, Board, Position); % Check the last row.
    find_diagonal_piece(Player, Board, Position). % Check the diagonal.

% Find the first piece in the first column.
find_first_column_piece(Player, Board, X/Y) :-
    nth1(Y, Board, Row),
    nth1(1, Row, Player),
    !, % Cut to prevent backtracking once a match is found.
    X = 1.

% Find the first piece in the last row.
find_last_row_piece(Player, Board, X/Y) :-
    last(Board, LastRow),
    nth1(X, LastRow, Player),
    !, % Cut to prevent backtracking once a match is found.
    length(Board, Y).

% Find the first piece on the diagonal where X = Y.
find_diagonal_piece(Player, Board, Position) :-
    find_diagonal_piece_helper(Player, Board, 1, Position).

find_diagonal_piece_helper(Player, Board, Index, Index/Index) :-
    nth1(Index, Board, Row),
    nth1(Index, Row, Player),
    !. % Cut to prevent backtracking once a match is found.

find_diagonal_piece_helper(Player, Board, Index, Position) :-
    Index < 8,
    NextIndex is Index + 1,
    find_diagonal_piece_helper(Player, Board, NextIndex, Position).

%%%
player_wins(Player) :-
    board(Board),
    % Find all starting edge pieces for the player.
    findall(Position, find_edge_piece(Player, Board, Position), StartPoints),
    % Check if there is a connection between any of the start points to the other side.
    % Depending on how your game rules define a win, implement the connection check here.
    % For example, if a win is just having any piece on opposing sides:
    member(X1/Y1, StartPoints),
    member(X2/Y2, StartPoints),
    % Check if the two points are on different sides.
    % For example, here we just check if Y1 is 1 and Y2 is 8 for a vertical win.
  
    !.  % Cut to prevent further unnecessary backtracking if a win is found.

  



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



askForBoardPosition(Position) :-
        write('Select a board position (1-36)'),
        nl,
        write('> '),
        read(Position).

askTypeOfMove(Player) :-
        printPlayerTurn(Player),
        write('You want to:'),
        nl,
        write('Insert a new letter -> 1'),
        nl,
        write('Move a letter to another adjacent board position-> 2'),
        nl,
        write('> '),
        read(Input),
        read_type_of_move_input(Input).

read_type_of_move_input(1) :- write('insertPiece').
read_type_of_move_input(2) :- write('movePiece').
read_type_of_move_input(_Other) :-      write('You want to:'),
                                        nl,
                                        write('Invalid option... Try again!'),
                                        nl,
                                        write('Insert a new letter -> 1'),
                                        nl,
                                        write('Move a letter to another adjacent board position-> 2'),
                                        nl,
                                        write('> '),
                                        read(Input),
                                        read_type_of_move_input(Input).


/**
 * printPlayerTurn(+Player)
 *
 * Displays the player's turn message
*/
printPlayerTurn(Player) :-
    format('>> Your turn, ~p <<~n~n', [Player]).

congratulateWinner(Winner) :-
    playerString(Winner, PString),
    write('Congratulations, '),
    write(PString),
    write('! You won the game!'), skip_line.    





playerString(a, 'Player A').
playerString(b, 'Player B'). 