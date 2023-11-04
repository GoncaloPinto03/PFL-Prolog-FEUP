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

/*

PLACE VERSION

game_loop(CurrentPlayer) :-
    display_board, % Display the current game board
    display_board_stack, % Display the current game board stack
    nl, write('Player '), write(CurrentPlayer), write("'s turn."), nl,    
    
    get_player_place_play(CurrentPlayer, Row, Column), % Get the player's move

    (valid_place(CurrentPlayer, Row, Column) -> % Check if the move is valid
        place_piece(Row, Column, CurrentPlayer),
        (player_wins(CurrentPlayer) -> % Check if the player wins
            display_board,
            display_board_stack,
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
*/
 

game_loop(CurrentPlayer) :-
    display_board,
    display_board_stack,
    nl, write('Player '), write(CurrentPlayer), write("'s turn."), nl,

    get_player_move_play_from(CurrentPlayer, Row1, Column1),
    get_player_move_play_to(CurrentPlayer, Row2, Column2),

    % Check if the move is valid
    (valid_move(CurrentPlayer, Row1, Column1) ->

        % Check if the stack heights are equal
        (equivalence_stack(Row1, Column1, Row2, Column2) ->
            % Check if the move is to an adjacent cell
            (is_adjacent_cell(Row1, Column1, Row2, Column2) ->
                % If all conditions are met, move the piece
                move_piece(Row1, Column1, Row2, Column2, CurrentPlayer),
                (player_wins(CurrentPlayer) ->
                    display_board,
                    display_board_stack,
                    write('Player '), write(CurrentPlayer), write(' wins! Game over.'), nl
                ;
                    % Switch to the other player and continue the game
                    switch_player(CurrentPlayer, NextPlayer),
                    game_loop(NextPlayer)
                )
            ;
                % If the move is not to an adjacent cell, display a message and try again
                write('Piece can only be moved to an adjacent cell! Try again.'), nl,
                game_loop(CurrentPlayer)
            )
        ;
            % If the stack heights are not equal, display a message and try again
            write('Stack heights are not equal! Try again.'), nl,
            game_loop(CurrentPlayer)
        )
    ;
        write('Invalid move. Try again.'), nl,
        game_loop(CurrentPlayer)
    ).




% Define a predicate to get the player's move (row and column)
get_player_place_play(Player, Row, Column) :-
    repeat,
    write('Enter the row (1-8) and column (1-8) where you want to place your piece (e.g., "3 5"): '),
    read(RowInput),
    read(ColumnInput),
    valid_input_place(RowInput, ColumnInput, Row, Column, Player),
    !. % Cut operator (!) to stop the repeat loop

% Define a predicate to get the player's move (row and column)
get_player_move_play_from(Player, Row, Column) :-
    repeat,
    write('Enter the row (1-8) and column (1-8) from where you want to move your piece (e.g., "3 5"): '),
    read(RowInput),
    read(ColumnInput),
    valid_input_move(RowInput, ColumnInput, Row, Column, Player),
    !. % Cut operator (!) to stop the repeat loop

% Define a predicate to get the player's move (row and column)
get_player_move_play_to(Player, Row, Column) :-
    repeat,
    write('Enter the row (1-8) and column (1-8) to where you want to move your piece (e.g., "3 5"): '),
    read(RowInput),
    read(ColumnInput),
    switch_player(Player, NextPlayer),
    valid_input_move(RowInput, ColumnInput, Row, Column, NextPlayer),
    switch_player(NextPlayer, Player),
    !. % Cut operator (!) to stop the repeat loop

% Define a predicate to validate the input
valid_input_place(RowInput, ColumnInput, Row, Column, Player) :-
    integer(RowInput),
    integer(ColumnInput),
    between(1, 8, RowInput), % Validate row input (1-8)
    between(1, 8, ColumnInput), % Validate column input (1-8)
    Row is RowInput - 1, % Adjust for 0-based indexing
    Column is ColumnInput - 1, % Adjust for 0-based indexing
    valid_place(Player, Row, Column). % Check if the move is valid based on game rules

% Define a predicate to validate the input
valid_input_move(RowInput, ColumnInput, Row, Column, Player) :-
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

switch_player(playerA, bot).
switch_player(bot, playerA).

% Define the win condition check (you need to implement this)
%player_wins(Player) :- 

% Define a basic valid_place predicate for placing a piece in an empty cell
valid_place(Player, Row, Column) :-
    board(Board),
    nth0(Row, Board, RowList),
    nth0(Column, RowList, empty),
    player(Player).


valid_move(Player, Row, Column) :-
    board(Board),
    nth0(Row, Board, RowList),
    nth0(Column, RowList, Player),
    player(Player).




% Game loop for Player A vs Bot
game_loop_pc(CurrentPlayer) :-
    display_board,
    display_board_stack,
    nl,
    (CurrentPlayer = playerA ->
        write('Player A\'s turn.'),
        get_player_place_play(CurrentPlayer, Row, Column)
    ;
        write('Bot\'s turn.'),
        make_bot_move(Row, Column) % Implement the bot's move predicate
    ),
    (valid_place(CurrentPlayer, Row, Column) ->
        place_piece(Row, Column, CurrentPlayer),
        (player_wins(CurrentPlayer) -> % Check if the player wins
            display_board,
            display_board_stack,
            write('Player '), write(CurrentPlayer), write(' wins! Game over.'), nl
        ;
            % Switch to the other player and continue the game
            switch_player(CurrentPlayer, NextPlayer),
            game_loop_pc(NextPlayer)
        )
    ;
        write('Invalid move. Try again.'), nl,
        game_loop_pc(CurrentPlayer)
    ).

game_loop_cc(CurrentPlayer) :-
    display_board, % Display the current game board
    display_board_stack, % Display the current game board stack
    (CurrentPlayer = playerA ->
        write('Player A\'s turn.'),
        make_bot_move(Row, Column) % Implement the bot's move predicate
    ;
        write('Player B\'s turn.'),
        make_bot_move(Row, Column) % Implement the bot's move predicate
    ),
    (valid_place(CurrentPlayer, Row, Column) -> % Check if the move is valid
        place_piece(Row, Column, CurrentPlayer), % Update the game board
        (player_wins(CurrentPlayer) -> % Check if the player wins
            display_board,
            display_board_stack,
            write('Player '), write(CurrentPlayer), write(' wins! Game over.'), nl
        ;
            % Switch to the other player and continue the game
            switch_player(CurrentPlayer, NextPlayer),
            game_loop_cc(NextPlayer)
        )
    ;
        write('Invalid move. Try again.'), nl,
        game_loop_cc(CurrentPlayer) % Stay on the same player's turn
    ).

% Bot move predicate (random move)
make_bot_move(Row, Column) :-
    repeat,
    random(0, 7, RandomRow), % Generate a random row (0-7)
    random(0, 7, RandomCol), % Generate a random column (0-7)
    valid_place(bot, RandomRow, RandomCol), % Check if the random move is valid
    Row is RandomRow,
    Column is RandomCol,
    !. % Cut operator to stop the repeat loop



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



% Define a predicate to check if a player has won by connecting the sides of the triangle
player_wins(Player) :-
    % Find a starting piece on the left side of the triangle
    find_starting_piece(Player, LeftStart),
    % Perform a DFS starting from the left side piece
    dfs_left_to_right(LeftStart, Player, [], Visited),
    % Check if the DFS reaches the bottom side
    find_bottom_piece(Player, BottomPiece),
    member(BottomPiece, Visited).

% Define a predicate to find a starting piece on the left side of the triangle
find_starting_piece(Player, [Row, 1]) :-
    between(1, 8, Row), % Iterate through rows
    board(CellList),   % Get the current state of the board
    nth1(Row, CellList, RowList),
    nth1(1, RowList, Player).

% Define a predicate to find a piece on the bottom side of the triangle
find_bottom_piece(Player, [8, Column]) :-
    between(1, 8, Column), % Iterate through columns
    board(CellList),       % Get the current state of the board
    nth1(8, CellList, RowList),
    nth1(Column, RowList, Player).

% Define a predicate to perform a DFS from left to right
dfs_left_to_right([Row, Column], Player, Visited, FinalVisited) :-
    % Base case: If the current piece is on the right side, stop
    right_side_spaces(RightSides),
    member([Row, Column], RightSides).
dfs_left_to_right([Row, Column], Player, Visited, FinalVisited) :-
    % Recursive case: Move to adjacent cells
    adjacent_cells(Row, Column, AdjacentCells),
    member([NextRow, NextColumn], AdjacentCells),
    board(CellList), % Get the current state of the board
    nth1(NextRow, CellList, RowList),
    nth1(NextColumn, RowList, Player),
    % Check if the adjacent cell has the same player's piece
    \+ member([NextRow, NextColumn], Visited), % Use \+ for negation
    dfs_left_to_right([NextRow, NextColumn], Player, [[NextRow, NextColumn] | Visited], FinalVisited).


% Define the right side spaces of the triangle
right_side_spaces([[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8]]).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



askForBoardPosition(Position) :-
        write('Select a board position (1-36)'),
        nl,
        write('> '),
        read(Position).

askTypeOfMove(Player, Row, Column):-
        write('You want to:'),
        nl,
        write('Insert a new letter -> 1'),
        nl,
        write('Move a letter to another adjacent board position-> 2'),
        nl,
        write('> '),
        read(Input),
        read_type_of_move_input(Input).

read_type_of_move_input(1) :- get_player_place_play(Player, Row, Column).
read_type_of_move_input(2) :- write('movePiece').
read_type_of_move_input(_Other) :-      write('You want to:'),
                                        nl,
                                        write('Invalid option... Try again!'),
                                        nl,
                                        askTypeOfMove(Player, Row, Column).
                                        

  
 