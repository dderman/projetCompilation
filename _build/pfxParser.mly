%{
  open PfxAst
  (* Ocaml code here*)

%}

(**************
 * The tokens *
 **************)
%token EOF PUSH POP SWAP ADD SUB MUL DIV REM
%token <int> INT


(******************************
 * Entry points of the parser *
 ******************************)

%start < PfxAst.program > program
%%

(*************
 * The rules *
 *************)

program:
 | PUSH n=INT p=program { (Push n)::p} 
 | POP p=program { Pop::p }
 | SWAP p=program { Swap::p }
 | ADD p=program  { Add::p }
 | SUB p=program {Sub::p}
 | MUL p=program {Mul::p}
 | DIV p=program {Div::p} 
 | REM p=program {Rem::p}
 | EOF {[]}            
%%

