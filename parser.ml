exception Error

type token = 
  | SUB
  | OBRACE
  | NUMBER of (
# 6 "parser.mly"
       (string)
# 10 "parser.ml"
)
  | NEWLINE
  | MUL
  | MOD
  | DIV
  | CBRACE
  | ADD

and _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  mutable _menhir_token: token;
  mutable _menhir_startp: Lexing.position;
  mutable _menhir_endp: Lexing.position;
  mutable _menhir_shifted: int
}

and _menhir_state = 
  | MenhirState15
  | MenhirState12
  | MenhirState9
  | MenhirState7
  | MenhirState5
  | MenhirState1
  | MenhirState0


# 1 "parser.mly"
  
    open ArithExpr

# 42 "parser.ml"
let _eRR =
  Error

let rec _menhir_run12 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 49 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv99 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 57 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NUMBER _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | OBRACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv100)

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 73 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv97 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 81 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NUMBER _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | OBRACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv98)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_p0 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 102 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state) * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 112 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 120 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ADD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | CBRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv79 * _menhir_state) * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 131 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _ = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv77 * _menhir_state) * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 138 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, _2) = _menhir_stack in
            let _v : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 144 "parser.ml"
            ) = 
# 45 "parser.mly"
                    (_2)
# 148 "parser.ml"
             in
            _menhir_goto_p2 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv78)) : 'freshtv80)
        | SUB ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv81 * _menhir_state) * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 160 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)) : 'freshtv84)) : 'freshtv86)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 169 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 177 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | ADD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | NEWLINE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 188 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv87 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 194 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (
# 18 "parser.mly"
      (ArithExpr.arith_expr)
# 200 "parser.ml"
            ) = 
# 26 "parser.mly"
              (_1)
# 204 "parser.ml"
             in
            _menhir_goto_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv88)) : 'freshtv90)
        | SUB ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv91 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 216 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)) : 'freshtv94)) : 'freshtv96)
    | _ ->
        _menhir_fail ()

and _menhir_run5 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 226 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv75 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 234 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NUMBER _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | OBRACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv76)

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 250 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv73 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 258 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NUMBER _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | OBRACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv74)

and _menhir_run9 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 274 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv71 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 282 "parser.ml"
    )) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NUMBER _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | OBRACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv72)

and _menhir_goto_p1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 298 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 308 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 316 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack)
        | ADD | CBRACE | NEWLINE | SUB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv47 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 331 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 337 "parser.ml"
            ) = 
# 31 "parser.mly"
                      (_1)
# 341 "parser.ml"
             in
            _menhir_goto_p0 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv48)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv49 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 351 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)) : 'freshtv52)) : 'freshtv54)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 360 "parser.ml"
        )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 364 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 372 "parser.ml"
        )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 376 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack)
        | ADD | CBRACE | NEWLINE | SUB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 391 "parser.ml"
            )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 395 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 401 "parser.ml"
            ) = 
# 32 "parser.mly"
              (Op(Op_Sub, _1, _3))
# 405 "parser.ml"
             in
            _menhir_goto_p0 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv56)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv57 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 415 "parser.ml"
            )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 419 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)) : 'freshtv60)) : 'freshtv62)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 428 "parser.ml"
        )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 432 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        let _tok = _menhir_env._menhir_token in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 440 "parser.ml"
        )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 444 "parser.ml"
        )) = _menhir_stack in
        let (_tok : token) = _tok in
        ((match _tok with
        | DIV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack)
        | MOD ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
        | MUL ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack)
        | ADD | CBRACE | NEWLINE | SUB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv63 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 459 "parser.ml"
            )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 463 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _1), _, _3) = _menhir_stack in
            let _v : (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 469 "parser.ml"
            ) = 
# 33 "parser.mly"
              (Op(Op_Add, _1, _3))
# 473 "parser.ml"
             in
            _menhir_goto_p0 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv64)
        | _ ->
            assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
            _menhir_env._menhir_shifted <- (-1);
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv65 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 483 "parser.ml"
            )) * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 487 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)) : 'freshtv68)) : 'freshtv70)
    | _ ->
        _menhir_fail ()

and _menhir_goto_p2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 497 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 | MenhirState15 | MenhirState12 | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 508 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_1 : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 516 "parser.ml"
        )) = _v in
        ((let _v : (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 521 "parser.ml"
        ) = 
# 37 "parser.mly"
        (_1)
# 525 "parser.ml"
         in
        _menhir_goto_p1 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv32)) : 'freshtv34)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 533 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 539 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 545 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 551 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 557 "parser.ml"
        ) = 
# 38 "parser.mly"
              (Op(Op_Mul, _1, _3))
# 561 "parser.ml"
         in
        _menhir_goto_p1 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv36)) : 'freshtv38)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 569 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 575 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 581 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 587 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 593 "parser.ml"
        ) = 
# 40 "parser.mly"
              (Op(Op_Mod, _1, _3))
# 597 "parser.ml"
         in
        _menhir_goto_p1 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv40)) : 'freshtv42)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 605 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 611 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 617 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let (_3 : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 623 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 629 "parser.ml"
        ) = 
# 39 "parser.mly"
              (Op(Op_Div, _1, _3))
# 633 "parser.ml"
         in
        _menhir_goto_p1 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv44)) : 'freshtv46)

and _menhir_discard : _menhir_env -> token =
  fun _menhir_env ->
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = _menhir_env._menhir_lexer lexbuf in
    _menhir_env._menhir_token <- _tok;
    _menhir_env._menhir_startp <- lexbuf.Lexing.lex_start_p;
    _menhir_env._menhir_endp <- lexbuf.Lexing.lex_curr_p;
    let shifted = Pervasives.(+) _menhir_env._menhir_shifted 1 in
    if Pervasives.(>=) shifted 0 then
      _menhir_env._menhir_shifted <- shifted;
    _tok

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 657 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * (
# 19 "parser.mly"
      (ArithExpr.arith_expr)
# 666 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 675 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 684 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * (
# 20 "parser.mly"
      (ArithExpr.arith_expr)
# 693 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv30)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _tok = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv15 * _menhir_state) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NUMBER _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | OBRACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv16)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "parser.mly"
       (string)
# 727 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _ = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 6 "parser.mly"
       (string)
# 737 "parser.ml"
    )) = _v in
    ((let _v : (
# 21 "parser.mly"
      (ArithExpr.arith_expr)
# 742 "parser.ml"
    ) = 
# 44 "parser.mly"
           (Value(Bigint.bigint_of_string _1))
# 746 "parser.ml"
     in
    _menhir_goto_p2 _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

and _menhir_goto_line : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "parser.mly"
      (ArithExpr.arith_expr)
# 753 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 18 "parser.mly"
      (ArithExpr.arith_expr)
# 762 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_1 : (
# 18 "parser.mly"
      (ArithExpr.arith_expr)
# 770 "parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv10)) : 'freshtv12)

and line : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 18 "parser.mly"
      (ArithExpr.arith_expr)
# 777 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = lexer lexbuf in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_startp = lexbuf.Lexing.lex_start_p;
        _menhir_endp = lexbuf.Lexing.lex_curr_p;
        _menhir_shifted = max_int;
        }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = () in
    ((assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
    let _tok = _menhir_env._menhir_token in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = _menhir_stack in
    let (_tok : token) = _tok in
    ((match _tok with
    | NEWLINE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _v : (
# 18 "parser.mly"
      (ArithExpr.arith_expr)
# 811 "parser.ml"
        ) = 
# 27 "parser.mly"
           (Value(Bigint.bigint_of_string "0"))
# 815 "parser.ml"
         in
        _menhir_goto_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv2)) : 'freshtv4)
    | NUMBER _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | OBRACE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (Pervasives.(<>) _menhir_env._menhir_shifted (-1));
        _menhir_env._menhir_shifted <- (-1);
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv6)) : 'freshtv8))


(*trailer*)


