open BinOp ;;

type expression =
  | Const of int
  | Var of string
  | Binop of Binop.t * expression * expression 
  | Uminus of expression ;;

(*its use is in its name*)
let rec string_of_expr exp =
  match exp with
  | Const c -> string_of_int c
  | Var v -> v
  | Binop(op,e1,e2) -> (string_of_binop op)^(string_of_expr e1)^(string_of_expr e2)
  | Uminus e -> "UMINUS"^(string_of_expr e) ;;

(*this function should evaluate expressions as it is a constant or a variable*)
(*the value of the variables should be registered into the list env, which is of type "string*int list"*)
let rec eval env exp = match exp with
	| Const c -> c
	| Var v -> (try List.assoc v env with Not_found -> raise(Unbound_variable v))
	| _ -> failwith "neither a variable nor a value..."
	;;

(*a simple function to return the corresponding string for a binary operator*)
(*this function is principally an auxiliary function for the function generate*)
let string_of_binop bop = match bop with
	| Badd -> "add "
	| Bsub -> "sub "
	| Bmul -> "mul "
	| Bdiv -> "div "
	| Bmod -> "rem " ;;

(*a function that should generate the corresponding pfx code for a given expression coded in EXPR*)
(*the result is a string*)
let generate env expression = match expression with
	| Const c -> "push "^(eval expression)^" "
	| Var v -> "push "^(eval env expression)^" "
	| Binop(op,e1,e2) -> (generate env e1)^(generate env e2)^(string_of_binop op)
	| Uminus e -> "push 0 push "^(generate env e)^"sub " ;;