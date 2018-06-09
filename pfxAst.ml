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


(* function to print the pfx AST *)
let generate prog =
	let rec generate_aux p = match p with
		| [] -> "[]"
		| PUSH(n)::pgm -> "  push("^(string_of_int n)^") \n    |    \n"^generate_aux pgm
		| POP::pgm -> "  pop\n    |    \n"^generate_aux pgm
		| REM::pgm -> "  rem\n    |    \n"^generate_aux pgm
		| ADD::pgm -> "  add\n    |    \n"^generate_aux pgm
		| SWAP::pgm -> "  swap\n    |    \n"^generate_aux pgm
		| SUB::pgm -> "  sub\n    |    \n"^generate_aux pgm
		| MUL::pgm -> "  mul\n    |    \n "^generate_aux pgm
		| DIV::pgm -> "  div\n    |    \n"^generate_aux pgm
	in print_string (generate_aux prog)
 