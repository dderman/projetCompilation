(* This snippet of code is is the same as the one provided before question 7.1 *)
type expression =
  | Const of int
  | Var of string
  | Binop of BinOp.t * expression * expression
  | Uminus of expression
  (* For function support *)
  | App of expression * expression
  | Fun of string * expression

