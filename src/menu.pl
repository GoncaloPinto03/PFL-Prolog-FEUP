%########################## MENU FUNCTIONS ##########################

% DISPLAYS THE MENU OF THE GAME
display_menu:- write('***********************************************************************************************'),nl,
       write('*                                                                                             *'),nl,
       write('*   @@@@@@@  @@@@@@@@@  @@@@@@@@  @@@@@@@    @@@@@@@@   *   OPTIONS  *      DESCRIPTION       *'),nl,
       write('*  @@     @@ @@         @@       @@     @@   @@         *            *                        *'),nl,
       write('*  @@     @@ @@         @@       @@     @@   @@         *      1     *    PLAYER VS PLAYER    *'),nl,
       write('*  @@@@@@@@@ @@  @@@@@  @@@@@@@@ @@@@@@@@@   @@@@@@@@   *      2     *    PLAYER VS COMPUTER  *'),nl,
       write('*  @@     @@ @@     @@  @@       @@ @@       @@         *      3     *  COMPUTER VS COMPUTER  *'),nl,
       write('*  @@     @@ @@     @@  @@       @@   @@     @@         *      4     *      INSTRUCTIONS      *'),nl,
       write('*  @@     @@ @@@@@@@@@  @@@@@@@@ @@     @@   @@@@@@@@   *      0     *          EXIT          *'),nl,
       write('*                                                                                             *'),nl,
       write('*  *****************************************************************************************  *'),nl,
       write('*                                                                                             *'),nl,
       write('*                                                              @@@@  @@@@  @  @  @@@          *'),nl,
       write('*          GONÇALO PINTO  * UP202108693                        @     @     @  @  @  @         *'),nl,
       write('*          GONÇALO SANTOS * UP202108839                        @@@   @@@@  @  @  @@@          *'),nl,
       write('*                                                              @     @     @  @  @            *'),nl,
       write('*                                                              @     @@@@  @@@@  @            *'),nl,
       write('*                                                                                             *'),nl,
       write('***********************************************************************************************'),nl.

% DISPLAYS THE INSTRUCTIONS OF THE GAME
display_instructions :- write('***********************************************************************************************'),nl,
                write('*                                                                                             *'),nl,
                write('*                                           AGERE                                             *'),nl,
                write('*                                                       2 players | 15-30 minutes | ages 8+   *'),nl,
                write('*                                                                                             *'),nl,
                write('*    MATERIALS: 35 A''s and 35 B''s; game board as shown                                       *'),nl,
                write('*                                                                                             *'),nl,
                write('*    SETUP: One player places an A on any space. The other player decides                      *'),nl,
                write('*    which letter (A or B) to play. B goes first.                                             *'),nl,
                write('*                                                                                             *'),nl,
                write('*    GOAL: You win if, at the start of your turn, a single group of your stacks connects.     *'),nl,
                write('*    the 3 sides of the board. Corner spaces connect to both adjacent sides.                  *'),nl,
                write('*                                                                                             *'),nl,
                write('*    A stack is yours if your number is on top. A single number is a stack                    *'),nl,
                write('*                                                                                             *'),nl,
                write('*    PLAYING THE GAME                                                                         *'),nl,
                write('*    On your turn take 1 of these 2 actions:                                                  *'),nl,
                write('*        1) place your letter on an empty space;                                              *'),nl,
                write('*        2) move a letter of yours from the top of a stack onto a neighboring                 *'),nl,
                write('*           opponens stack of exactly the same height.                                        *'),nl,
                write('*                                                                                             *'),nl,
                write('***********************************************************************************************'),nl.

% DISPLAYS THE MENU
menu :- display_menu, nl, choose_option, read(Input), read_input(Input).

% READS THE INPUT GIVEN BY THE USER
read_input(1) :- write('test'). % start_game().
read_input(2) :- write('test'). % play_pc.
read_input(3) :- write('test').% play_cc.
read_input(4) :- display_instructions.
read_input(0) :- exit_game.

read_input(_Other) :-  write('Invalid option... Try again!'),
                       nl,
                       choose_option,
                       read(Input),
                       read_input(Input).

choose_option :- write('> Choose an option ').

% Clears the terminal screen
clear :- write('\e[2J').

exit_game :- clear, nl, write('Good bye! Thanks for playing ;)').

% play_pc :- start_game().
% play_cc :- start_game().

% start_game()



