(*--build-config
  options:--verify_module FStar.UInt8;
  other-files:FStar.Ghost.fst axioms.fst intlib.fst sint.fst;
  --*)

module FStar.UInt8

(* Defines secret bytes *)

open FStar.Ghost
open IntLib
open Sint

assume val n: x:pos{x = 8}

type uint8 = usint n
type sbyte = uint8

let (zero:uint8) = uzero n
let (one:uint8) = uone n
let (ones:uint8) = uones n

let (max_int:erased nat) = eumax_int #n
let (min_int:erased nat) = eumin_int #n

let (bits:pos) = n

(* Standard operators *)
let add a b = uadd #n a b
let add_mod a b = uadd_mod #n a b
let sub a b = usub #n a b
let sub_mod a b = usub_mod #n a b
let mul a b = umul #n a b
let mul_mod a b = umul_mod #n a b
let div a b = udiv #n a b
let rem a b = umod #n a b

let logand a b = ulogand #n a b
let logxor a b = ulogxor #n a b
let logor a b = ulogor #n a b
let lognot a = ulognot #n a

let shift_left a s = ushift_left #n a s
let shift_right a s = ushift_right #n a s

let rotate_left a s = urotate_left #n a s
let rotate_right a s = urotate_right #n a s

let to_uint8 s = to_usint n s
let of_native_int s = to_usint n s

assume val of_string: string -> Tot uint8
assume val of_int: int -> Tot uint8

let op_Less_Less = shift_left
let op_Greater_Greater = shift_right