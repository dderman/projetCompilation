{
 
 type token =
  | PUSH | POP | SWAP | ADD | SUB | MUL | DIV | REM | EOF
  | INT of int | IDENT of string
let mk_int nb =
 try INT (int_of_string nb)
 with Failure _ -> failwith (Printf.sprintf "Illegal integer '%s': " nb)
}
let newline = (['\n' '\r'] | "\r\n")
let blank = [' ' '\014' '\t' '\012']
let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let linecomment = "(*" [^ '\n' '\r']* "*)"
digit+ as nb
let binop = "add"|"sub"|"mul"|"div"
(* *)

rule token = parse
 | newline+ {token lexbuf}
 | blank+ {token lexbuf}
 | digit+ as nb {mk_int nb}
 
 | "push" { PUSH }
 | "pop"  { POP }
 | "swap" { SWAP }
 | "add"  { ADD }
 | "sub"  { SUB }
 | "mul"  { MUL }
 | "div"  { DIV }
 | "rem"  { REM }
 | letter (letter | digit | '_')* as var { IDENT var }
 | eof { EOF }
| _ as c { failwith (Printf.sprintf "Illegal character '%c': " c)}