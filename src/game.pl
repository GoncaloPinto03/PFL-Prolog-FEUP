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

/**
 * gameInit(+BoardSize, +GameType)
 *
 * Initiates the game
*/
gameInit(P1-P2) :-
        initialState(GameState),
        displayGame(GameState),
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
chooseMove((Board, Player), p, Move) :-
        playerString(Player, PString),
        askTypeOfMove(PString, Num),
        boardDimensions(Board, LineNumber, ColumnNumber),
        chooseTypeOfMove(Num, LineNumber, ColumnNumber, Move).

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

askForBoardPosition(Position) :-
        write('Select a board position (1-36)'),
        nl,
        write('> '),
        read(Position).

askTypeOfMove(Player, Type) :-
        write('You want to:'),
        nl,
        write('Insert a new letter -> 1'),
        nl,
        write('Move a letter to another adjacent board position-> 2'),
        nl,
        write('> '),
        read(Input),
        saveType(Input, Type).
        