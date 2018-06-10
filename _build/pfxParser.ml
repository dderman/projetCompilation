
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | SWAP
    | SUB
    | REM
    | PUSH
    | POP
    | MUL
    | INT of (
# 11 "pfxParser.mly"
       (int)
# 17 "pfxParser.ml"
  )
    | EOF
    | DIV
    | ADD
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState11
  | MenhirState10
  | MenhirState8
  | MenhirState7
  | MenhirState6
  | MenhirState4
  | MenhirState3
  | MenhirState2
  | MenhirState1

# 1 "pfxParser.mly"
  
  open PfxAst
  (* Ocaml code here*)


# 54 "pfxParser.ml"

let rec _menhir_goto_pgm : _menhir_env -> 'ttv_tail -> _menhir_state -> (PfxAst.program) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 34 "pfxParser.mly"
              ( Add::p )
# 68 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 37 "pfxParser.mly"
             (Div::p)
# 80 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 36 "pfxParser.mly"
             (Mul::p)
# 92 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 32 "pfxParser.mly"
             ( Pop::p )
# 104 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let ((_menhir_stack, _menhir_s), (n : (
# 11 "pfxParser.mly"
       (int)
# 114 "pfxParser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 31 "pfxParser.mly"
                    ( (Push n)::p)
# 120 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 38 "pfxParser.mly"
             (Rem::p)
# 132 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 35 "pfxParser.mly"
             (Sub::p)
# 144 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (PfxAst.program)) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (PfxAst.program) = 
# 33 "pfxParser.mly"
              ( Swap::p )
# 156 "pfxParser.ml"
         in
        _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (pg : (PfxAst.program)) = _v in
        let (_menhir_stack, (_1 : (
# 11 "pfxParser.mly"
       (int)
# 166 "pfxParser.ml"
        ))) = _menhir_stack in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 171 "pfxParser.ml"
        ) = 
# 27 "pfxParser.mly"
              (pg)
# 175 "pfxParser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_1 : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 182 "pfxParser.ml"
        )) = _v in
        Obj.magic _1

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | DIV ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | EOF ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | MUL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | POP ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | PUSH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | REM ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | DIV ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EOF ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | MUL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | POP ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | PUSH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | REM ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | DIV ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | EOF ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | MUL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | POP ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | PUSH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | REM ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | DIV ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | EOF ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | MUL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | POP ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | PUSH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | REM ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | SUB ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | SWAP ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | DIV ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | EOF ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | MUL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | POP ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | PUSH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | REM ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | DIV ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | EOF ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | MUL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | POP ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | PUSH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | REM ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (PfxAst.program) = 
# 39 "pfxParser.mly"
       ([])
# 418 "pfxParser.ml"
     in
    _menhir_goto_pgm _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | DIV ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | EOF ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | MUL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | POP ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | PUSH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | REM ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | DIV ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | EOF ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | MUL ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | POP ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | PUSH ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | REM ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | SUB ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | SWAP ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 495 "pfxParser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | DIV ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | EOF ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | MUL ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | POP ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | PUSH ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | REM ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | SUB ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | SWAP ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)

# 41 "pfxParser.mly"
  


# 547 "pfxParser.ml"

# 219 "/home/samuel/.opam/system/lib/menhir/standard.mly"
  


# 553 "pfxParser.ml"
