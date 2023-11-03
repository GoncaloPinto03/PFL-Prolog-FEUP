:- consult('game.pl').

%########################## MENU FUNCTIONS ##########################

% DISPLAYS THE MENU OF THE GAME
display_menu:-  nl,
                write('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *'),nl,
                write('*                                                       *                                       *'),nl,
                write('*   @@@@@@@  @@@@@@@@@  @@@@@@@@  @@@@@@@    @@@@@@@@   *   OPTIONS          DESCRIPTION        *'),nl,
                write('*  @@     @@ @@         @@       @@     @@   @@         *                                       *'),nl,
                write('*  @@     @@ @@         @@       @@     @@   @@         *      1           PLAYER VS PLAYER     *'),nl,
                write('*  @@@@@@@@@ @@  @@@@@  @@@@@@@@ @@@@@@@@@   @@@@@@@@   *      2           PLAYER VS COMPUTER   *'),nl,
                write('*  @@     @@ @@     @@  @@       @@ @@       @@         *      3         COMPUTER VS COMPUTER   *'),nl,
                write('*  @@     @@ @@     @@  @@       @@   @@     @@         *      4             INSTRUCTIONS       *'),nl,
                write('*  @@     @@ @@@@@@@@@  @@@@@@@@ @@     @@   @@@@@@@@   *      0                 EXIT           *'),nl,
                write('*                                                       *                                       *'),nl,
                write('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *'),nl,
                write('*                                                       *                                       *'),nl,
                write('*                                                       *         @@@@  @@@@  @  @  @@@         *'),nl,
                write('*          GONÇALO PINTO  * UP202108693                 *         @     @     @  @  @  @        *'),nl,
                write('*                                                       *         @@@   @@@@  @  @  @@@         *'),nl,
                write('*          GONÇALO SANTOS * UP202108839                 *         @     @     @  @  @           *'),nl,
                write('*                                                       *         @     @@@@  @@@@  @           *'),nl,
                write('*                                                       *                                       *'),nl,
                write('* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *'),nl.

% DISPLAYS THE INSTRUCTIONS OF THE GAME
display_instructions :- write('***********************************************************************************************'),nl,
                        write('*                                                                                             *'),nl,
                        write('*                                           AGERE                                             *'),nl,
                        write('*                                                       2 players | 15-30 minutes | ages 8+   *'),nl,
                        write('*                                                                                             *'),nl,
                        write('*    MATERIALS: 35 A''s and 35 B''s; game board as shown                                        *'),nl,
                        write('*                                                                                             *'),nl,
                        write('*    SETUP: One player places an A on any space. The other player decides                     *'),nl,
                        write('*    which letter (A or B) to play. B goes first.                                             *'),nl,
                        write('*                                                                                             *'),nl,
                        write('*    GOAL: You win if, at the start of your turn, a single group of your stacks connects.     *'),nl,
                        write('*    the 3 sides of the board. Corner spaces connect to both adjacent sides.                  *'),nl,
                        write('*                                                                                             *'),nl,
                        write('*    A stack is yours if your number is on top. A single number is a stack                    *'),nl,
                        write('*                                                                                             *'),nl,
                        write('*    PLAYING THE GAME:                                                                        *'),nl,
                        write('*    On your turn take 1 of these 2 actions:                                                  *'),nl,
                        write('*        1) place your letter on an empty space;                                              *'),nl,
                        write('*        2) move a letter of yours from the top of a stack onto a neighboring                 *'),nl,
                        write('*           opponens stack of exactly the same height.                                        *'),nl,
                        write('*                                                                                             *'),nl,
                        write('*    LEGEND:                                                                                  *'),nl,
                        write('*                                                                                             *'),nl,
                        write('*       2     2 is the heigth of the stack (num of pieces on top of each other)               *'),nl,
                        write('*    16-A     A is the piece on top of the stack (could be B or E -> empty cell)              *'),nl,
                        write('*             16 is the number of that board space so that a user can select that space       *'),nl,
                        write('*                                                                                             *'),nl,
                        write('***********************************************************************************************'),nl.

% CLEARS THE TERMINAL SCREEN
clear_display :- write('\e[2J').

% DISPLAYS THE MENU
menu :- repeat,
        clear_display,
        display_menu,
        nl,
        menu_choose_option,
        read(Input),
        read_menu_input(Input).


/**
 * startGame(+Type)
 *
 * Starts game of the given Type
 *
 * Type -> p-p, p-[e,h] or [e,h]-[e,h]
 * p = player, e = easy bot, h = hard bot
 */
startGame(Type) :-
    clear_display,
    gameInit(Type),
    fail. % Go back to menu


play_pp :-
    initialize_board, % Initialize the game board
    game_loop(playerA).

play_pc :-      get_name(player1),
                asserta((name_of(player2, 'bot'))), !, 
                write('Choose the dificulty of your oponent'),
                nl,
                dificulty_choose_option(Input),
                startGame(p-Input).
                
play_cc :-      write('Choose the dificulty of player 1'),
                dificulty_choose_option(Input1),
                write('Choose the dificulty of player 2'),
                dificulty_choose_option(Input2),
                startGame(Input1-Input2).

instructions :- display_instructions,
                nl,
                write('Back -> 1'),
                nl,
                write('Exit Game -> 2'),
                nl,
                write('> '),
                read(Input),
                read_instructions_input(Input).

% READS THE INPUT GIVEN BY THE USER
read_menu_input(1) :- play_pp.
read_menu_input(2) :- write('play_pc'). 
read_menu_input(3) :- write('play_cc').
read_menu_input(4) :- instructions.
read_menu_input(0) :- exit_game.

read_menu_input(_Other) :-      write('Invalid option... Try again!'),
                                nl,
                                write('Back -> 1'),
                                nl,
                                write('Exit Game -> 2'),
                                nl,
                                write('> '),
                                read(Input),
                                read_instructions_input(Input).

read_instructions_input(1) :-   clear_display,
                                nl,
                                menu.

read_instructions_input(2) :-   exit_game.
            
read_instructions_input(_Other) :-      write('Invalid option... Try again!'),
                                        nl,
                                        menu_choose_option,
                                        read(Input),
                                        read_menu_input(Input).

menu_choose_option :-   write('Choose an option (0-4)'),
                        nl,
                        write('> ').


exit_game :- clear_display, nl, write('Good bye! Thanks for playing ;)').

dificulty_choose_option(Input) :-
                write('Choose a dificulty (1 or 2)'),
                nl,
                write('Easy (Random) -> 1'),
                nl,
                write('Hard (Greedy) -> 2'),
                nl,
                write('> '),
                read(Input),
                read_dificulty_input(Input).


read_dificulty_input(1) :- write('Easy').
read_dificulty_input(2) :- write('Hard').
read_dificulty_input(_Other) :- write('Invalid option... Try again!'),
                                nl,
                                dificulty_choose_option(Input),
                                read(Input),
                                read_dificulty_input(Input).


