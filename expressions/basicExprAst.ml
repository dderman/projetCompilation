(* This is the snippet of code provided before question 3.1 *)
open BinOp ;;

type expression =
  | Const of int
  | Var of string
  | Binop of Binop.t * expression * expression 
  | Uminus of expression ;;

let rec string_of_expr exp =
  match exp with
  | Const c -> string_of_int c
  | Var v -> v
  | Binop(op,e1,e2) -> op^(string_of_expr e1)^(string_of_expr e2)
  | Uminus e -> "UMINUS"^(string_of_expr e) ;;

let rec eval env exp = match exp with
	| Const c -> c
	| Var v -> (try List.assoc v env with Not_found -> raise(Unbound_variable v))
	;;

let generate_binop bop = match bop with
	| Badd -> "ADD"
	| Bsub -> "SUB"
	| Bmul -> "MUL"
	| Bdiv -> "DIV"
	| Bmod -> "REM" ;;

let generate env expression = match expression with
	| Const c -> "PUSH"^(eval expression)
	| Var v -> "PUSH"^(eval env expression)
	| Binop(op,e1,e2) -> (generate env e1)^(generate env e2)^(generate_binop op)
	| Uminus e -> "PUSH0"^"PUSH"^(generate env e)^"SUB" ;;