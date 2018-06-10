%{
  open PfxAst
%}

(**************
 * The tokens *
 **************)
%token EOF PUSH POP SWAP ADD SUB MUL DIV REM
%token <int> INT


(*****************************
 * Entry point of the parser *
 *****************************)

%start < PfxAst.program > program
%%

(*************
 * The rules *
 *************)


program:
 | INT pg=pgm {pg} 
 (*INT is for the number of arguments indicated at 
 the beginning of the input file*)

pgm:
 | PUSH n=INT p=pgm { (Push n)::p} 
 | POP p=pgm { Pop::p }
 | SWAP p=pgm { Swap::p }
 | ADD p=pgm  { Add::p }
 | SUB p=pgm {Sub::p}
 | MUL p=pgm {Mul::p}
 | DIV p=pgm {Div::p} 
 | REM p=pgm {Rem::p}
 | EOF {[]}
        
%%

