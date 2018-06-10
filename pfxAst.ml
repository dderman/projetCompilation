type command = (*après discussion avec Grégoire, ne pas mettre de push of int. Il avait raison pour la structure linéaire.
			Mais comment gérer le fait d'avoir des arguments ?! *)
	| Push of int  | Pop | Rem | Add | Swap | Sub | Mul | Div

type program = command list (* Nil | Prog of program * command *)

(* add here all useful functions and types  related to the AST: for instance  string_of_ functions *)

let rec string_of_program prog = match prog with
| [] -> "in empty stack."
| Push(n)::pgm -> "push "^(string_of_int n)^", "^string_of_program pgm
| Pop::pgm -> "pop, "^string_of_program pgm
| Rem::pgm -> "rem, "^string_of_program pgm
| Add::pgm -> "add, "^string_of_program pgm
| Swap::pgm -> "swap, "^string_of_program pgm
| Sub::pgm -> "sub, "^string_of_program pgm
| Mul::pgm -> "mul, "^string_of_program pgm
| Div::pgm -> "div, "^string_of_program pgm


(* function to print the pfx AST *)
let generate prog =
	let rec generate_aux p = match p with
		| [] -> "   []\n"
		| Push(n)::pgm -> "  push("^(string_of_int n)^") \n    |    \n"^generate_aux pgm
		| Pop::pgm -> "   pop\n    |    \n"^generate_aux pgm
		| Rem::pgm -> "   rem\n    |    \n"^generate_aux pgm
		| Add::pgm -> "   add\n    |    \n"^generate_aux pgm
		| Swap::pgm -> "   swap\n    |    \n"^generate_aux pgm
		| Sub::pgm -> "   sub\n    |    \n"^generate_aux pgm
		| Mul::pgm -> "   mul\n    |    \n "^generate_aux pgm
		| Div::pgm -> "   div\n    |    \n"^generate_aux pgm
	in print_string("Pfx AST:\n");
	print_string (generate_aux prog)
 