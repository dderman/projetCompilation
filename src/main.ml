(*the main function of the file*)
(*this function should compile an pfx file into an expr file, but as it is now it is just capable of printing a pfx AST from a pfx file*)
let compile file =
  print_string ("File "^file^" is being treated!\n");
  try
    let input_file = open_in file in
    let lexbuf = Lexing.from_channel input_file in
    begin
      (*initializing the lexing buffer*)
    	Location.init lexbuf file ;
        try
            (*building the pfx AST to be printed*)
            let ast = PfxParser.program PfxLexer.token lexbuf in
            PfxAst.print_ast ast;
        with
        (*telling the user where the error is, whenever there is an error*)
          | LexingII.Error(msg,loc) ->  Location.print loc ; 
                                        print_string msg ;
                                        lexbuf.lex_eof_reached <- true; (*to end the process*)
        close_in input_file
    end
  with Sys_error s ->
    print_endline ("Can't find file '" ^ file ^ "'");;


let _ = Arg.parse [] compile "";;






		