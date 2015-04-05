(*  Bigint module by ghukas_g and malbra_t *)

type sign

type t

type base = Binary | Octal | Decimal | Hexadecimal

val bigint_of_string : string -> t

val string_of_bigint : t -> string

val string_of_bigint_base : base -> t -> string

val add : t -> t -> t

val sub : t -> t -> t

val mul : t -> t -> t

val div : t -> t -> t

val modulo : t -> t -> t
