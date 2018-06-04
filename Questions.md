

## Exercice 1

### question 1.1

Une pile est une sructure de donnée de type Lifo (last in first out).
On peut généralement lui appliquer les opérations push, pop, swap, empty (pour savoir si elle est vide), et top (pour avoir le premier élément de la pile sans le détruire).



## Exercice 2

### question 2.1

* sémantique 1 : Si le nombre d'arguments donné est différent du nombre d'arguments attendu, alors une erreur est retournée.

* sémantique 2 : Si au cours de l'application de la séquence d'instructions Q à la pile v1::...::vn::ø donne une erreur, alors au cours de l'éxecution du programme i,Q avec les arguments v1, ..., vn, une erreur sera retournée.

* sémantique 3 : Si l'application de la séquenece Q à la pile donnée à n éléments donne la pile v::S, alors l'éxecution du programme n,Q avec les arguments v1, ..., vn retourne la valeur v (sommet de la pile).

### question 2.2

Le comportement lorsque la pile est vide. Que se passe-t-il s'il y a plus d'instructions de valeurs ? On imaginera qu'une erreur est alors retournée. On peut en déduire le règle suivante :
```
(4)    Q, v1:: ...:: vn :: ø -> Q',ø
      -------------------------------
      v1, ..., vn |- n,Q => ERR
```

### question 2.3


* pour le pop :
```
(1)   pop.Q, v1::S -> Q, S
```

* pour le push :
```
(2)   (push x).Q, S -> Q, x::S
```

* pour le swap :
```
(3)   swap.Q, v1::v2::S -> Q, v2::v1::S
```

* pour les opérations arithmétiques/binaires :
```
(4)   op in {add,mul,div} r=v1 op v2
     -------------------------------------------------
      op.Q, v1::v2::Q -> r::S
```

* pour l'erreur de div et rem :
```
(5)  od in {div,rem}
    ------------------
     od.Q,v1::0::S -> ERR
```

* pour l'erreur de pop :
```
         S = ø
    ---------------
     pop.Q,S -> ERR
```
### question 2.4
```
type command = 
    | PUSH of int | POP | SWAP | ADD | SUB | MUL | DIV | REM ;;
```
### question 2.5


```
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



let stack = [];;
let liste,x = step POP stack in
print_int x ;;
```



## Exercice 3

### question 3.1

* Schéma de compilation Expr -> PFx :

1. Const(i) -> PUSH i
2. pour Var(s) -> PUSH valeur_associée_à_Var(s)()  
3. Binop(op,exp,exp) -> PUSH valeur_associée_à_Exp(exp1) PUSH valeur_associée_à_Exp(exp2) op
4. Uminus(exp) -> PUSH (-1) PUSH valeur_associée_à_Exp(exp) MUL 

* Description formelle : 
Notons E la fonction d'environnement qui associe la valeur d'une
1. ` E-| Const i -> PUSH i `
2.
```   
       x € dom(E)
 ----------------------
    E -| Var x => E(x)
```
3.
```   
     E-|e1 =>v1   E-|e2 =>v2   OP|-binop=>op
 ----------------------------------------------------
    E,BINOP -| op(e1, e2) => PUSH v1 PUSH v2 op
```

4.
```   
                   E-|e1 =>v1
 ----------------------------------------------------
    E -| -exp => PUSH -1 PUSH valeur_associée_à_Exp(exp) op
```

### question 3.2

```
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
  ```


## exercice 4

### question 4.1

```
{
 
type token =
  | PUSH | POP | SWAP | ADD | SUB | MUL | DIV | REM | EOF
  | INT of int | IDENT of string ;;
let mk_int nb =
 try INT (int_of_string nb)
 with Failure _ -> failwith (Printf.sprintf "Illegal integer '%s': " nb) ;;

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
  | IDENT s -> s;;
}
let newline = (['\n' '\r'] | "\r\n")
let blank = [' ' '\014' '\t' '\012']
let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z']
let linecomment = "(*" [^ '\n' '\r']* "*)"
let binop = "add"|"sub"|"mul"|"div"


rule token = parse

 (*new lines*)
 | newline+ {token lexbuf}

 (*blanks*)
 | blank+ {token lexbuf}

 (* integers*)
 | digit+ as nb {mk_int nb}
 
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
 | _ as c { failwith (Printf.sprintf "Illegal character '%c': " c)}
```

### question 4.2

```
open PfxLexer ;;

let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    begin
      while not lexbuf.lex_eof_reached do
        print_string (string_of_token(token lexbuf)^"\n") ;
      done;
      print_string (string_of_token(token lexbuf)^"\n") (* to print the end of file*);
      close_in (input_file)
    end
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'");;
```


## Exercie 5

### question 5.1

* Modifications dans pfxLexer.mll :

```
{...
  let mk_int nb lexbuf =
    try INT (int_of_string nb)
    with Failure _ -> 
        let loc = Location.curr lexbuf and msg = Printf.sprintf "Illegal integer '%s'\n " nb in
        raise (LexingII.Error (msg,loc))
...}
rule token = parse
...
 (*new lines*)
 | newline {Newline   (* | newline+ {token lexbuf}*)}
...
 (* integers*)
 | digit+ as nb {mk_int nb lexbuf}
...
 (*illegal characters*)
 | _ as c { let loc = Location.curr lexbuf and msg = Printf.sprintf "Illegal character '%c'\n" c in 
      raise (LexingII.Error(msg, loc))}
```

* Modifications dans main.ml :

```
let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    begin
      Location.init lexbuf file ;
      while not lexbuf.lex_eof_reached do
        try
          let tok = token lexbuf in
          print_string (string_of_token(tok)^"\n") ;
          if tok = Newline then
            Location.incr_line lexbuf ;
        with
          (* To tell the user where the error is, whenever an there is an error. *)
          | LexingII.Error(msg,loc) ->  
              Location.print loc ; 
              print_string msg ;
              lexbuf.lex_eof_reached <- true (*to end the process*)
      done;
      close_in (input_file)
    end
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'");;
```


## Exercise 6