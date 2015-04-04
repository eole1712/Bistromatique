(*header*)
{open Test}

(*definitions*)
let binadigit = ['0'-'1']
let octadigit = ['0'-'7']
let decadigit = ['0'-'9']
let hexadigit = ['0'-'9' 'A'-'F']

let number = "0b"binadigit+ | "0"octadigit+ | decadigit+ | "Ox"hexadigit+

let add = "+"
let sub = "-"
let div = "/"
let mul = "*"
let modulo = "%"
let blank = [' ' '\t']
let obrace = "("
let cbrace = ")"
let newline = "\n"


(*rules*)
rule token = parse
  |add {ADD}
  |sub {SUB}
  |div {DIV}
  |mul {MUL}
  |modulo {MOD}
  |number as str  {NUMBER (str)}
  |blank {token lexbuf}
  |obrace {OBRACE}
  |cbrace {CBRACE}
  |newline {NEWLINE}
  |eof {raise End_of_file}

(*trailer*)
{}
