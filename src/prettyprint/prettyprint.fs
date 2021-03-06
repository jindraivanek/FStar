(*
   Copyright 2016 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)
#light "off"

module FStar.Pprint

open FSharp.PPrint
open FStar.BaseTypes

type document = Doc of unit
//
//  | Empty
//  | Char of char
//  | String of string * int * int
//  | FancyString of string * int * int * int
//  | Blank of int
//  | IfFlat of document * document
//  | HardLine
//  | Cat of document * document
//  | Nest of int * document
//  | Group of document
//  //| Probe of (indentation:int -> bol:int -> line:int -> column:int -> document)

let not_impl_msg = "F# prettyprinter not yet implemented."

let empty : document = failwith not_impl_msg

let doc_of_char (c:char) : document = failwith not_impl_msg
let doc_of_string (s:string) : document = failwith not_impl_msg
let doc_of_bool (b:bool) : document = failwith not_impl_msg

let substring (s:string) (sofs:int) (len:int) : document = failwith not_impl_msg

let fancystring (s:string) (ofs:int) : document = failwith not_impl_msg

let fancysubstring (s:string) (ofs:int) (len:int) (app_len:int) : document = failwith not_impl_msg

let utf8string (s:string) : document = failwith not_impl_msg

let hardline : document = failwith not_impl_msg

let blank (n:int) : document = failwith not_impl_msg

let break_ (n:int) : document = failwith not_impl_msg

let op_Hat_Hat (doc1:document) (doc2:document) : document = failwith not_impl_msg
let op_Hat_Slash_Hat (doc1:document) (doc2:document) : document = failwith not_impl_msg

let nest (j:int) (doc:document) : document = failwith not_impl_msg

let group (doc:document) : document = failwith not_impl_msg

let column (_: int -> document): document = failwith not_impl_msg
let nesting (_: int -> document): document = failwith not_impl_msg
let position (_: int -> int -> int -> document): document = failwith not_impl_msg

let ifflat (doc1:document) (doc2:document) : document = failwith not_impl_msg

let align (doc:document) : document = failwith not_impl_msg

let lparen: document = Doc ()
let rparen: document = Doc ()
let langle: document = Doc ()
let rangle: document = Doc ()
let lbrace: document = Doc ()
let rbrace: document = Doc ()
let lbracket: document = Doc ()
let rbracket: document = Doc ()
let squote: document = Doc ()
let dquote: document = Doc ()
let bquote: document = Doc ()
let semi: document = Doc ()
let colon: document = Doc ()
let comma: document = Doc ()
let space: document = Doc ()
let dot: document = Doc ()
let sharp: document = Doc ()
let slash: document = Doc ()
let backslash: document = Doc ()
let equals: document = Doc ()
let qmark: document = Doc ()
let tilde: document = Doc ()
let at: document = Doc ()
let percent: document = Doc ()
let dollar: document = Doc ()
let caret: document = Doc ()
let ampersand: document = Doc ()
let star: document = Doc ()
let plus: document = Doc ()
let minus: document = Doc ()
let underscore: document = Doc ()
let bang: document = Doc ()
let bar: document = Doc ()
let larrow: document = Doc ()
let rarrow: document = Doc ()

let precede (l:document) (x:document) : document = failwith not_impl_msg

let terminate (r:document) (x:document) : document = failwith not_impl_msg

let enclose (l:document) (r:document) (x:document) : document = failwith not_impl_msg

let squotes (d:document) : document = failwith not_impl_msg
let dquotes (d:document) : document = failwith not_impl_msg
let bquotes (d:document) : document = failwith not_impl_msg
let braces  (d:document) : document = failwith not_impl_msg
let parens  (d:document) : document = failwith not_impl_msg
let angles  (d:document) : document = failwith not_impl_msg
let brackets(d:document) : document = failwith not_impl_msg

let twice (doc:document) : document = failwith not_impl_msg

let repeat (n:int) (doc:document) : document = failwith not_impl_msg

let concat (docs:document list) : document = failwith not_impl_msg

let separate (sep:document) (docs:document list) : document = failwith not_impl_msg

let concat_map (f:('a -> document)) (xs:'a list) : document = failwith not_impl_msg

let separate_map (sep:document) (f:('a -> document)) (xs:'a list) : document = failwith not_impl_msg

let separate2 (sep:document) (last_sep:document) (docs:document list) : document = failwith not_impl_msg

let optional (f:('a -> document)) (opt:'a option) : document = failwith not_impl_msg

let lines (s:string) : document list = failwith not_impl_msg

let arbitrary_string (s:string) : document = failwith not_impl_msg

let words (s:string) : document list = failwith not_impl_msg

let split (ok:(char -> bool)) (s:string) : document list = failwith not_impl_msg

let flow (sep:document) (docs:document list) : document = failwith not_impl_msg

let flow_map (sep:document) (f:('a -> document)) (docs:'a list) : document = failwith not_impl_msg

let url (s:string) : document = failwith not_impl_msg

let hang (n:int) (doc:document) : document = failwith not_impl_msg

let prefix (n:int) (b:int) (left: document) (right:document) : document = failwith not_impl_msg

let jump (n:int) (b:int) (right:document) : document = failwith not_impl_msg

let infix (n:int) (b:int) (middle:document) (left: document) (right:document) : document = failwith not_impl_msg

let surround (n:int) (b:int) (opening:document) (contents:document) (closing:document) : document = failwith not_impl_msg

let soft_surround (n:int) (b:int) (opening:document) (contents:document) (closing:document) : document = failwith not_impl_msg

let surround_separate (n:int) (b:int) (v:document) (opening:document) (sep:document) (closing:document) (docs:document list) : document = failwith not_impl_msg

let surround_separate_map (n:int) (b:int) (v:document) (opening:document) (sep:document) (closing:document) (f:('a -> document)) (docs:'a list) : document = failwith not_impl_msg

let ( ^^ ) (x:document) (y:document) : document = failwith not_impl_msg

// let ( !^ ) (s:string) : document = failwith not_impl_msg

let ( ^/^ ) (x:document) (y:document) : document = failwith not_impl_msg

// let ( ^//^ ) (x:document) (y:document) : document = failwith not_impl_msg

let pretty_string (rfrac:float) (width:int) (doc:document) : string = failwith not_impl_msg
let pretty_out_channel (rfrac:float) (width:int) (doc:document) (channel:FStar.Util.out_channel) : unit = failwith not_impl_msg
