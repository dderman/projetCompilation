type command = 
	| PUSH of int  | Ucomm of uCommand | Bcomm of bCommand
type uCommand = POP | REM
type bCommand = ADD | SWAP | SUB | MUL | DIV


type program = Nil | Prog of program * command 

(* add here all useful functions and types  related to the AST: for instance  string_of_ functions *)

let string_of_program prog = match prog with
| Nil -> " in empty stack."
| Prog(Nil,com) -> 