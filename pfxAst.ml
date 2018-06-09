type command = (*après discussion avec Grégoire, ne pas mettre de push of int. Il avait raison pour la structure linéaire.
			Mais comment gérer le fait d'avoir des arguments ?! *)
	| PUSH of int  | Ucomm of uCommand | Bcomm of bCommand
type uCommand = POP | REM
type bCommand = ADD | SWAP | SUB | MUL | DIV


type program = Nil | Prog of program * command 

(* add here all useful functions and types  related to the AST: for instance  string_of_ functions *)

let string_of_program prog = match prog with
| Nil -> " in empty stack."
| Prog(Nil,com) -> 