(* Entry point of the program, should contain your main function: here it is
 named compile, it is the function provided after question 4.1 *)

open PfxLexer ;;
open Location ;;
open LexingII ;;

(*(* To tell the user where the error is, whenever an there is an error. *)
let position = 

let error = Error("Illegal character",position) in
failwith(fst(error)^" at "^snd(error))*)

let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    begin
    	while not lexbuf.lex_eof_reached do
    		(*try*)
    		let tok = token lexbuf in
    		  print_int(lexbuf.lex_start_p.pos_lnum);
    		  print_string ("\n"^string_of_token(tok)^"\n") ;
    		  Location.print lexbuf.lex_start_p ;
    		  if tok = Newline then
    		  	Location.incr_line lexbuf ;

    		(*with
    		  | Error(str,loc) -> print_string(str^" from characters "^string_of_int loc.loc_start.pos_bol^" to "^string_of_int loc.loc_end.pos_bol^" in line "^) *)

    	done;
    	close_in (input_file)
    end
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'");;

(* The following line should be uncommented and adapted after question 5.1: *)
let _ = Arg.parse [] compile "";;



(*)
 *)


		