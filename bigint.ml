(*  Bigint module by ghukas_g and malbra_t *)

type sign = Minus | Zero | Plus

(* type base = Binary | Octal | Decimal | Hexadecimal *)

type abs_value = string

type t = (sign * abs_value)

(* let abs_value (_, value) = value *)

(* let get_sign (sign, value) = sign *)

(* String Outils  *)

let _move_left abs_value n =
  let res = String.make ((String.length abs_value) + n) '0' in
  begin
    String.blit abs_value 0 res 0 (String.length abs_value);
    res
  end

let rev s =
  let l = Str.split (Str.regexp "") s in
  List.fold_left (fun a b -> b ^ a) "" l

let rec pure s i =
  if (String.length s == 0)
  then raise (invalid_arg "Empty String")
  else if s.[i] != '0' || (String.length s) - i == 1
  then (String.sub s i ((String.length s) - i))
  else pure s (i + 1)

let isZero s =
  let tmp = pure s 0 in
  if (String.length tmp) = 1 && tmp.[0] = '0'
  then true
  else false

(* End String Outils  *)

let bigint_of_string s =
  let my_string_without_sign s i len si =
    if si == true
    then (Plus , (pure (String.sub s i len) 0))
    else (Minus , (pure (String.sub s i len) 0))
  in let rec my_bigint_of_string s i len sign =
       if len < 0 then failwith (invalid_arg "Empty String")
       else
	 match s.[i] with
	 | '-' -> my_bigint_of_string s (i + 1) (len - 1) (not sign)
	 | '+' -> my_bigint_of_string s (i + 1) (len - 1) (sign)
	 | _ -> my_string_without_sign s i len sign
     in let z = pure s 0 in
	if (String.length z) == 0
	then raise (invalid_arg "Empty String")
	else if (String.length z) == 1 && z.[0] == '0'
	then (Zero, "0")
	else my_bigint_of_string s 0 (String.length s) true

let get_abs_value (_, abs_value) = abs_value

let get_sign (sign, _) = sign

let string_of_bigint (sign, abs_value) = match sign with
  | Minus -> "-"^abs_value
  | Plus -> abs_value
  | Zero -> "0"

let _base = "0123456789ABCDEF"

let _add abs_value abs_value2 =
  let rec addinf n1 n2 res i st =
    if i = (String.length n1)
    then if st > 0
	 then begin
	     res.[i] <- _base.[st];
	     pure (rev res) 0
	   end
	 else pure (rev res) 0
    else
      let nb = if i >= (String.length n2)
	       then (String.index _base n1.[i]) + st
	       else (String.index _base n1.[i]) + (String.index _base n2.[i] + st)
      in let st = nb / 10 in
	 begin
	   res.[i] <- _base.[(nb mod 10)];
	   addinf n1 n2 res (i + 1) st
	 end
  in if (String.length abs_value) > (String.length abs_value2)
     then (Plus, addinf (rev abs_value) (rev abs_value2) (String.make ((String.length abs_value) + 1) '0') 0 0)
     else (Plus, addinf (rev abs_value2) (rev abs_value) (String.make ((String.length abs_value2) + 1) '0') 0 0)

let _sub abs_value abs_value2 =
  let rec subinf n1 n2 res i st =
    if i = (String.length n1)
    then pure (rev res) 0
    else
      let nb = if i >= (String.length n2)
  	       then (String.index _base n1.[i]) - st
  	       else (String.index _base n1.[i]) - String.index _base n2.[i] - st
      in let st = if nb < 0 then 1 else 0 in
  	 let nb = if st == 1 then nb + 10 else nb
  	 in
  	 begin
  	   res.[i] <- _base.[(nb)];
  	   subinf n1 n2 res (i + 1) st
  	 end
  in if (String.length abs_value) > (String.length abs_value2) ||
	  ((String.length abs_value) == (String.length abs_value2) && (String.compare abs_value abs_value2) == 1)
     then (Plus, subinf (rev abs_value) (rev abs_value2) (String.make (String.length abs_value) '0') 0 0)
     else (Minus, subinf (rev abs_value2) (rev abs_value) (String.make (String.length abs_value2) '0') 0 0)


let add (sign, abs_value) (sign2, abs_value2) =
  if (sign == sign2)
  then (sign, get_abs_value (_add abs_value abs_value2))
  else match sign with
       | Plus -> _sub abs_value abs_value2
       | _ -> let tmp = (_sub abs_value abs_value2) in match (get_sign tmp) with
						       | Plus -> (Minus, (get_abs_value tmp))
						       | _ -> (Plus, (get_abs_value tmp))

let sub (sign, abs_value) (sign2, abs_value2) =
  if (sign2 == Zero)
  then (sign, abs_value)
  else if (sign == Zero)
  then if sign2 == Minus
       then (Plus, abs_value2)
       else (sign2, abs_value2)
  else let (s, r) = if (sign == sign2)
		 then _sub abs_value abs_value2
		 else (sign, get_abs_value (_add abs_value abs_value2))
       in if (isZero r)
	  then (Zero, "0")
	  else (s, r)

let rec _mul n1 n2 =
  if (String.length n2) > (String.length n1)
  then _mul n2 n1
  else
    let diff = (String.length n1) - (String.length n2) in
    let n2 = if diff > 0
	     then _move_left n2 diff
	     else n2
    in let rec _mul_eq n1 n2 =
	 let l1 = String.length n1 in
	 if l1 == 1
	 then string_of_int ((String.index _base n1.[0]) * (String.index _base n2.[0]))
	 else
	   let l = l1 / 2 in
	   let n11 = String.sub n1 0 (l1 - l) in
	   let n12 = String.sub n1 (l1 - l) l in
	   let n21 = String.sub n2 0 (l1 - l) in
	   let n22 = String.sub n2 (l1 - l) l in
	   let n1121 = _mul_eq n11 n21 in
	   let n1222 = _mul_eq n12 n22 in
	   let n1n2 = (_mul (get_abs_value (_add n11 n12)) (get_abs_value (_add n21 n22))) in
	   let n1_n2 = get_abs_value (_sub (get_abs_value (_sub n1n2 n1121)) n1222) in
	   get_abs_value (_add (get_abs_value (_add (_move_left n1121 (2 * l)) (_move_left n1_n2 l))) n1222)
       in let res = _mul_eq n1 n2 in
	  if diff > 0  && (isZero res) == false then
	    String.sub res 0 ((String.length res) - diff)
	  else res

let mul (sign, abs_value) (sign2, abs_value2) =
  if (sign == Zero || sign2 == Zero)
  then (Zero, "0")
  else if sign == sign2
  then (Plus, _mul abs_value abs_value2)
  else (Minus, _mul abs_value abs_value2)

let _div_mod_i n1 n =
  let l = (String.length n1) - 1 in
  let st = ref 0 in
  let res = n1 in
  begin
    for i = 0 to l do
      let a = (String.index _base n1.[i]) + !st * 10 in
      begin
	res.[i] <- _base.[a / n];
	st := a mod n;
      end
    done;
    (res, !st);
  end

let _cmp n1 n2 =
  let (sign, _) = sub (Plus, n1) (Plus, n2) in
  match sign with
    | Plus -> 1
    | Minus -> -1
    | Zero -> 0

let rec _div_mod a b =
  if (String.length b) <= 2
  then let tmp =
	 if (String.length b < 2)
	 then (String.index _base b.[0])
	 else (String.index _base b.[0]) * 10 + (String.index _base b.[1])
       in let (res, st) = _div_mod_i a tmp in
	  (res, (string_of_int st))
  else
    let n = ((String.length b) - 1) / 2 in
    let a0 = String.sub a ((String.length a) - n) n in
    let a1 = String.sub a 0 ((String.length a) - n) in
    if (_cmp a1 b) >= 0
    then let (q1, r1) = _div_mod a1 b in
	 let tmp = get_abs_value (_add (_move_left r1 n) a0) in
	 let (q0, r0) = _div_mod tmp b in
	 (get_abs_value (_add (_move_left q1 n) q0), r0)
    else let b0 = String.sub b ((String.length b) - n) n in
	 let b1 = String.sub b 0 ((String.length b) - n) in
	 let (q1, r1) = _div_mod a1 b1 in
	 let a_r1 = get_abs_value (_add (_move_left r1 n) a0) in
	 let b_r1 = _mul b0 q1 in
	 if (_cmp a_r1 b_r1) >= 0
	 then let st = get_abs_value (_sub a_r1 b_r1) in
	      (q1, st)
	 else let st = get_abs_value (_sub b_r1 a_r1) in
	      (get_abs_value (_sub q1 "1"), get_abs_value (_sub b st))

let div (sign, abs_value) (sign2, abs_value2) =
  if (sign2 == Zero || (isZero abs_value2))
  then raise (invalid_arg "Division by 0")
  else if sign == Zero
  then (sign, abs_value)
  else if _cmp abs_value abs_value2 == 0
  then if sign == sign2
       then (Plus,  "1")
       else (Minus, "1")
  else if _cmp abs_value abs_value2 == -1
  then (Zero, "0")
  else let (res, _) = _div_mod abs_value abs_value2 in
       if sign == sign2
       then (Plus, pure res 0)
       else (Minus, pure res 0)

let modulo (sign, abs_value) (sign2, abs_value2) =
  if (sign2 == Zero || (isZero abs_value2))
  then raise (invalid_arg "Modulo by 0")
  else if sign == Zero
  then (sign, abs_value)
  else if _cmp abs_value abs_value2 == 0
  then (Zero, "0")
  else if _cmp abs_value abs_value2 == -1
  then if sign == sign2
       then (Plus,  abs_value)
       else (Minus, abs_value)
  else let (_, st) = _div_mod abs_value abs_value2 in
       if sign == sign2
       then (Plus, pure st 0)
       else (Minus, pure st 0)


(* let string_of_bigint_base base (sign, abs_value) = *)
(*   let conv_base_abs_string abs_value = function *)
(* 	| Binary ->  *)
(*   match sign with *)
(*   | Minus -> "-" ^ (conv_base_abs_string abs_value base) *)
(*   | Plus -> (conv_base_abs_string abs_value base) *)
(*   | _ -> "0" *)
