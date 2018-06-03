{
type token =
  | Newline | PUSH | POP | SWAP | ADD | SUB | MUL | DIV | REM | EOF
  | INT of int | IDENT of string | RESULT of string;;

let mk_int nb lexbuf =
 try INT (int_of_string nb)
 with Failure _ -> 
 				let loc = Location.curr lexbuf and msg = Printf.sprintf "Illegal integer '%s'\n " nb in
 				raise (LexingII.Error (msg,loc))
 				(*failwith (Printf.sprintf "Illegal integer '%s': " nb)*) ;;

let string_of_token token = match token with
	| PUSH -> " PUSH "
	| POP -> " POP "
	| SWAP -> " SWAP "
	| ADD -> " ADD "
	| SUB -> " SUB "
	| MUL -> " MUL "
	| DIV ->  " DIV "
	| REM -> " REM "
	| EOF -> " EOF "
  	| INT n -> string_of_int n
  	| IDENT s -> s
  	| Newline -> " newline "
  	| RESULT s -> s;;
}
let newline = (['\n' '\r'] | "\r\n")
let blank = [' ' '\014' '\t' '\012']
let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let linecomment = "(*" [^ '\n' '\r']* "*)"
let result = "--" [^ '\n' '\r']*
let binop = "add"|"sub"|"mul"|"div"


rule token = parse

 (*new lines*)
 | newline {Newline   (* | newline+ {token lexbuf}*)}
 	

 (*blanks*)
 | blank+ {token lexbuf}

 (* integers*)
 | digit+ as nb {mk_int nb lexbuf}
 
 (*comments*)
 | linecomment {token lexbuf}

 (*expected result when given*)
 | result as res {RESULT res}

 (*commands*)
 | "push" { PUSH }
 | "pop"  { POP }
 | "swap" { SWAP }
 | "add"  { ADD }
 | "sub"  { SUB }
 | "mul"  { MUL }
 | "div"  { DIV }
 | "rem"  { REM }

 (*identifiers*)
 | letter (letter | digit | '_')* as var { IDENT var }

 (*end of file*)
 | eof { EOF }

 (*illegal characters*)
 | _ as c { let loc = Location.curr lexbuf and msg = Printf.sprintf "Illegal character '%c'\n" c in 
 			raise (LexingII.Error(msg, loc))
 	 (*failwith (Printf.sprintf "Illegal character '%c': " c)*)}


