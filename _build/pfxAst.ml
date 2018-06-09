type command = (*après discussion avec Grégoire, ne pas mettre de push of int. Il avait raison pour la structure linéaire.
			Mais comment gérer le fait d'avoir des arguments ?! *)
	| PUSH of int  | POP | REM | ADD | SWAP | SUB | MUL | DIV


type program = command list (* Nil | Prog of program * command *)

(* add here all useful functions and types  related to the AST: for instance  string_of_ functions *)

let rec string_of_program prog = match prog with
| [] -> "in empty stack."
| PUSH(n)::pgm -> "push "^(string_of_int n)^", "^string_of_program pgm
| POP::pgm -> "pop, "^string_of_program pgm
| REM::pgm -> "rem, "^string_of_program pgm
| ADD::pgm -> "add, "^string_of_program pgm
| SWAP::pgm -> "swap, "^string_of_program pgm
| SUB::pgm -> "sub, "^string_of_program pgm
| MUL::pgm -> "mul, "^string_of_program pgm
| DIV::pgm -> "div, "^string_of_program pgm
