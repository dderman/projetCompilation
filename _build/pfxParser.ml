
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
  | MenhirState10
  | MenhirState9
  | MenhirState7
  | MenhirState6
  | MenhirState5
  | MenhirState3
  | MenhirState2
  | MenhirState1
  | MenhirState0

# 1 "pfxParser.mly"
  
  open PfxAst
  (* Ocaml code here*)


# 54 "pfxParser.ml"

let rec _menhir_goto_program : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 59 "pfxParser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 69 "pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 76 "pfxParser.ml"
        ) = 
# 29 "pfxParser.mly"
                  ( Add::p )
# 80 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 89 "pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 96 "pfxParser.ml"
        ) = 
# 32 "pfxParser.mly"
                 (Div::p)
# 100 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 109 "pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 116 "pfxParser.ml"
        ) = 
# 31 "pfxParser.mly"
                 (Mul::p)
# 120 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 129 "pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 136 "pfxParser.ml"
        ) = 
# 27 "pfxParser.mly"
                 ( Pop::p )
# 140 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 149 "pfxParser.ml"
        )) = _v in
        let ((_menhir_stack, _menhir_s), (n : (
# 11 "pfxParser.mly"
       (int)
# 154 "pfxParser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 160 "pfxParser.ml"
        ) = 
# 26 "pfxParser.mly"
                        ( (Push n)::p)
# 164 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 173 "pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 180 "pfxParser.ml"
        ) = 
# 33 "pfxParser.mly"
                 (Rem::p)
# 184 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 193 "pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 200 "pfxParser.ml"
        ) = 
# 30 "pfxParser.mly"
                 (Sub::p)
# 204 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState1 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (p : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 213 "pfxParser.ml"
        )) = _v in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 220 "pfxParser.ml"
        ) = 
# 28 "pfxParser.mly"
                  ( Swap::p )
# 224 "pfxParser.ml"
         in
        _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_1 : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 233 "pfxParser.ml"
        )) = _v in
        Obj.magic _1

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
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
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
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
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3
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
    | INT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ADD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | DIV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | EOF ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | MUL ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | POP ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | PUSH ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | REM ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | SUB ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | SWAP ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 18 "pfxParser.mly"
       ( PfxAst.program )
# 469 "pfxParser.ml"
    ) = 
# 34 "pfxParser.mly"
       ([])
# 473 "pfxParser.ml"
     in
    _menhir_goto_program _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ADD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10

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
# 550 "pfxParser.ml"
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
    | ADD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DIV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | MUL ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | POP ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PUSH ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | REM ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SUB ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SWAP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 35 "pfxParser.mly"
  


# 591 "pfxParser.ml"

# 219 "/home/samuel/.opam/system/lib/menhir/standard.mly"
  


# 597 "pfxParser.ml"
