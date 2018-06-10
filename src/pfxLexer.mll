{
  open PfxParser ;;

(*type token =
  | PUSH | POP | SWAP | ADD | SUB | MUL | DIV | REM | EOF
  | INT of int | Newline | RESULT of string;;*)

let mk_int nb lexbuf =
 try INT (int_of_string nb)
 with Failure _ -> 
                let loc = Location.curr lexbuf and msg = Printf.sprintf "Illegal integer '%s'\n " nb in
                raise (LexingII.Error (msg,loc)) 
;;

let string_of_token token = match token with
    | PUSH -> " PUSH "
    | POP -> " POP "
    | SWAP -> " SWAP "
    | ADD -> " ADD "
    | SUB -> " SUB "
    | MUL -> " MUL "
    | DIV ->  " DIV "
    | REM -> " REM "
    | EOF -> " EOF"
    | INT n -> string_of_int n
    (*| Newline -> " newline "*)
    (*| RESULT s -> s*)
;;

(*a function to increment the line number in the lexing buffer
  when meeting a newline and to pass directly to the following token*)
let handle_newline f lexbuf =
    Location.incr_line lexbuf ;
    f lexbuf 
;;


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
 | newline {handle_newline token lexbuf  (* newline+ {token lexbuf}*)}
    

 (*blanks*)
 | blank+ {token lexbuf}

 (* integers*)
 | digit+ as nb {mk_int nb lexbuf}
 
 (*comments*)
 | linecomment {token lexbuf}

 (*commands*)
 | "push" { PUSH }
 | "pop"  { POP }
 | "swap" { SWAP }
 | "add"  { ADD }
 | "sub"  { SUB }
 | "mul"  { MUL }
 | "div"  { DIV }
 | "rem"  { REM }

 (*expected result when given*)
 | result {token lexbuf}
 (*| result as res {RESULT res}*) 

 (*end of file*)
 | eof { EOF }

 (*illegal characters*)
 | _ as c { let loc = Location.curr lexbuf and msg = Printf.sprintf "Illegal character '%c'\n" c in 
            raise (LexingII.Error(msg, loc))}


