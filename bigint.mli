(*  Bigint module by ghukas_g and malbra_t *)


module type BIGINT =
  sig

    type sign

    type t

    val bigint_of_string : string -> t

    (* val get_abs_value : t -> string *)

    (* val get_sign : t -> sign *)

    val string_of_bigint : t -> string

    (* val string_of_bigint_base : base -> t -> string *)

    val add : t -> t -> string

    val sub : t -> t -> string

  (* val mul : t -> t -> t *)

  (* val div : t -> t -> t *)

  (* val modulo : t -> t -> t *)

  end
