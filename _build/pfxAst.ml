
(*Voir justification de cette implémentation pour le type program dans le fichier Questions.md.*)
type command = 
	| Push of int  | Pop | Rem | Add | Swap | Sub | Mul | Div

type program = command list

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


(* Fonction pour afficher un arbre syntaxique abstrait Pfx. *)
let print_ast prog =
	let rec print_aux p = match p with
		| [] -> "   []\n"
		| Push(n)::pgm -> "  push("^(string_of_int n)^") \n    |    \n"^print_aux pgm
		| Pop::pgm -> "   pop\n    |    \n"^print_aux pgm
		| Rem::pgm -> "   rem\n    |    \n"^print_aux pgm
		| Add::pgm -> "   add\n    |    \n"^print_aux pgm
		| Swap::pgm -> "   swap\n    |    \n"^print_aux pgm
		| Sub::pgm -> "   sub\n    |    \n"^print_aux pgm
		| Mul::pgm -> "   mul\n    |    \n "^print_aux pgm
		| Div::pgm -> "   div\n    |    \n"^print_aux pgm
	in print_string("Pfx AST:\n");
	print_string (print_aux prog)
 