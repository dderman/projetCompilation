%{
  open basicExprAst
  open functionExprAst
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

%start < basicExprAst.expression > expression
%%
pfx: pgm=expr EOF { pgm }
expression:
 | e = expr EOF   { e }
expr:
 | e PUSH = expr PUSH { e push }
 | MINUS e=expr %prec UMINUS { Uminus e }
 | e1=expr op=bop e2=expr { Binop(op,e1,e2)}
 | id=IDENT               { Var id }
 | i = int                { Const i }
(*swap and pop*)
%inline bop:
 | SUB  { Bsub }   
 | ADD  { Badd }  
 | MUL  { Bmul }  
 | DIV  { Bdiv }  
 | REM  { Bmod }             

(*************
 * The rules *
 *************)

(* list all rules composing your grammar; obviously your entry point has to be present *)

