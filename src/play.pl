% CONSULT ALL FILES
:- consult('menu.pl').
:- consult('board.pl').
:- consult('utils.pl').
:- consult('game.pl').

/**
 * play/0
 *
 * Opens the game, in the menu
*/
play :- menu.