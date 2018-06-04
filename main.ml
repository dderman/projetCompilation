(* Entry point of the program, should contain your main function: here it is
 named compile, it is the function provided after question 4.1 *)

open PfxLexer ;;

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
    		  if tok = EOF then
    		  lexbuf.lex_eof_reached <- true ;
    		with
    			(* To tell the user where the error is, whenever an there is an error. *)
    		  | LexingII.Error(msg,loc) ->  Location.print loc ; 
    		  															print_string msg ;
    		  															lexbuf.lex_eof_reached <- true (*to end the process*)
    	done;
    	close_in (input_file)
    end
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'");;

(* The following line should be uncommented and adapted after question 5.1: *)
let _ = Arg.parse [] compile "";;



(*)
 *)


		