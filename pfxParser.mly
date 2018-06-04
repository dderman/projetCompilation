%{
  (* open PfxAst *)

  (* Ocaml code here*)

%}

(**************
 * The tokens *
 **************)
type token =
  
  | INT of int | IDENT of string;;
%token EOF PUSH POP SWAP ADD SUB MUL DIV REM
%token <int> INT
%token <string> IDENT

(******************************
 * Entry points of the parser *
 ******************************)

(* enter your %start clause here *)

(*************
 * The rules *
 *************)

(* list all rules composing your grammar; obviously your entry point has to be present *)

