open pfxParser ;;

let compile file =
 try
  let input_file = open_in file in
  let result = formula token (Lexing.from_channel input_file) in
  close_in (input_file);
  printf "read %s\n" result
 with Sys_error s ->
  printf "Can't find file '%s'" file
let () = Arg.parse [] compile ""
