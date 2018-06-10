(*open PfxLexer ;;*)
(* open PfxParser ;;  *)

let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    begin
    	Location.init lexbuf file ;
    	(*while not lexbuf.lex_eof_reached do
    		try
    	 	let tok = PfxLexer.token lexbuf in
    		  print_string (PfxLexer.string_of_token(tok)^"\n") ;
    		  if tok = EOF then
    		  lexbuf.lex_eof_reached <- true ; 
    		with
    			(* To tell the user where the error is, whenever there is an error. *)
    		  | LexingII.Error(msg,loc) ->  Location.print loc ; 
											print_string msg ;
											lexbuf.lex_eof_reached <- true (*to end the process*)
    	done; *)

        try
            let ast = PfxParser.program PfxLexer.token lexbuf in
            PfxAst.print_ast ast;
        with
        (* To tell the user where the error is, whenever there is an error. *)
          | LexingII.Error(msg,loc) ->  Location.print loc ; 
                                        print_string msg ;
                                        lexbuf.lex_eof_reached <- true; (*to end the process*)
        close_in input_file
    end
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'");;


let _ = Arg.parse [] compile "";;






		