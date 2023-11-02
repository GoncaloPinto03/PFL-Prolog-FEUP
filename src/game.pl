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

% game_cycle(+GameState)
% Loop that keeps the game running
game_cycle(GameState):-
    game_over(GameState, Winner), !,
    display_game(GameState),
    show_winner(GameState, Winner).
game_cycle(GameState):-
    display_game(GameState),
    print_turn(GameState),
    choose_move(GameState, Move),
    move(GameState, Move, NewGameState), !,
    game_cycle(NewGameState).

% game_over(+GameState, +Winner)
% Checks if the game is over
game_over([Board,OtherPlayer,_, _], Winner):-
    n_waters_to_win(NWatersToWin),
    other_player(OtherPlayer, Winner),
    count_waters(Board, Winner, NWatersToWin).

% display_game(+GameState)
% Prints the board
display_game([Board,_,_,_]) :-
    clear_console,
    length(Board, Size),
    display_header(1, Size),
    display_bar(Size),
    display_rows(Board, 1, Size).

% show_winner(+GameState, +Winner)
% Prints the winner of the game and number of moves they made
show_winner([_,_,_,TotalMoves], Winner):-
    name_of(Winner, Name),
    winner_moves(TotalMoves, WinnerMoves),
    format('Winner is ~a with ~d moves!\n', [Name, WinnerMoves]).

% print_turn(+GameState)
% Prints a message declaring whose turn it is
print_turn([_, Player, _, _]):-
    name_of(Player, Name),
    format('Player ~a, is your turn!\n', [Name]), !.


% move(+GameState, +Move, -NewGameState)
% Moves a piece
move(GameState, ColI-RowI-ColF-RowF, NewGameState):-                       
    [Board,Player,_,TotalMoves] = GameState,
    position(Board,ColI-RowI,Piece),
    put_piece(Board, ColI-RowI, empty, NewBoard1),
    put_piece(NewBoard1, ColF-RowF, Piece, NewBoard),
    other_player(Player, NewPlayer),
    forced_moves(NewBoard, NewPlayer, NewForcedMoves),
    NewTotalMoves is TotalMoves + 1,
    NewGameState = [NewBoard, NewPlayer, NewForcedMoves, NewTotalMoves].


























/**
 * gameInit(+BoardSize, +GameType)
 *
 * Initiates the game
*/
gameInit(BoardSize, P1-P2) :-
        initialState(BoardSize, GameState),
        displayGame,
        random_select(FirstPlayer, [P1, P2], _Rest),
        gameLoop(GameState, FirstPlayer, P1-P2).

/**
 * gameLoop(+GameState, +PlayerType, +GameType)
 *
 * Main game cycle
*/
gameLoop(GameState, PlayerType, GameType) :-
        gameOver(GameState, Winner), !,
        congratulateWinner(Winner).

gameLoop(GameState, PlayerType, GameType) :-
        chooseMove(GameState, PlayerType, Move),
        move(GameState, Move, NewGameState),
        nextPlayer(PlayerType, NewPlayerType, GameType),
        displayGame(NewGameState),
        gameLoop(NewGameState, NewPlayerType, GameType), !.

gameLoop(GameState, p, GameType) :-
        printInvalidMove,
        gameLoop(GameState, p, GameType), !. % Ask for another move



/**
 * chooseMove(+GameState, +PlayerType, -Move)
 *
 * Chooses the move according to the game state and player type
*/
chooseMove(Player) :-
        playerString(Player, PString),
        askTypeOfMove(PString).

chooseMove(GameState, Level, Move) :-
        validMoves(GameState, Moves),
        chooseMove(Level, GameState, Moves, Move).

chooseMove(e, (_Board, Player), Moves, Move) :-
        random_select(Move, Moves, _Rest),
        displayBotMove(Move, Player).

chooseMove(h, (Board, Player), Moves, Move) :-
        setof(Value-Mv, (NewBoard, Opponent)^( member(Mv, Moves),
        move((Board, Player), Mv, (NewBoard, Opponent)),
        switchColor(Opponent, Player),
        evaluateBoard((NewBoard, Player), Value) ), [_V-Move|_]),
        displayBotMove(Move, Player).


gameOver((Board,_), Player) :-
        validPlayer(Player),
        % missing evaluate function to check win (checkWin())
        checkWin(Board).


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