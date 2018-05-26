(* Entry point of the program, should contain your main function: here it is
 named compile, it is the function provided after question 4.1 *)

let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    (* work on the lexbuf *)
    close_in (input_file)
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'")

(* The following line should be uncommented and adapted after question 5.1: *)
(* let _ = Arg.parse [] compile "" *)


type command = 
    | PUSH of int | POP | SWAP | ADD | SUB | MUL | DIV | REM ;;

(* question 2.5 *)

let max_int = 10000000000 ;;

let step command stack = match command,stack with
    | POP, [] -> failwith "stack is empty"
    | POP, x::s -> s,x 
    | SWAP, [] -> [],max_int
    | SWAP, x::[] -> stack,max_int
    | SWAP, x1::x2::s -> x2::x1::s,max_int
    | PUSH(e), s -> e::s, max_int
    (* le reste est à coder *);;

let rec print_list = function 
[] -> ()
| e::l -> print_int e ; print_string " " ; print_list l ;;



let stack = [1;2;3];;
let liste,x = step POP stack in
print_char '\n' ; print_int x ; print_char '\n' ; print_list liste;;


type expression =
  | Const of int
  | Var of string
  | Binop of char * expression * expression (*BinOp.t * expression * expression*)
  | Uminus of expression ;;

let eval env exp = match exp with
   | Const(c) -> string_of_int c
   | Var v -> (try string_of_int(List.assoc v env) with Not_found -> failwith ("Unbound variable "^v))
   ;;

let generate_binop bop = match bop with
   | '+' -> "ADD"
   | '-' -> "SUB"
   | '*' -> "MUL"
   | '/' -> "DIV"
   | '%' -> "REM" ;;

let rec generate env expression = match expression with
   | Const c -> "PUSH"^(eval env expression)
   | Var v -> "PUSH"^(eval env expression)
   | Binop(op,e1,e2) -> (generate env e1)^(generate env e2)^(generate_binop op)
   | Uminus e -> "PUSH0"^"PUSH1"^"SUB"^"PUSH"^(generate env e)^"MUL" ;;

let env = [("coucou",45) ; ("miaou", 78)] in
print_string(generate env (Binop('+',Var("coucou"),Binop('*',Var "miaou",Const 1))) );; 



