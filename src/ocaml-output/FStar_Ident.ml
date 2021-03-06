open Prims
type ident = {
  idText: Prims.string;
  idRange: FStar_Range.range;}
type lident =
  {
  ns: ident Prims.list;
  ident: ident;
  nsstr: Prims.string;
  str: Prims.string;}
type lid = lident
let mk_ident: (Prims.string* FStar_Range.range) -> ident =
  fun uu____50  ->
    match uu____50 with | (text,range) -> { idText = text; idRange = range }
let reserved_prefix: Prims.string = "uu___"
let gen: FStar_Range.range -> ident =
  let x = FStar_Util.mk_ref (Prims.parse_int "0") in
  fun r  ->
    (let _0_127 =
       let _0_126 = FStar_ST.read x in _0_126 + (Prims.parse_int "1") in
     FStar_ST.write x _0_127);
    mk_ident
      (let _0_129 =
         let _0_128 = Prims.string_of_int (FStar_ST.read x) in
         Prims.strcat reserved_prefix _0_128 in
       (_0_129, r))
let id_of_text: Prims.string -> ident =
  fun str  -> mk_ident (str, FStar_Range.dummyRange)
let text_of_id: ident -> Prims.string = fun id  -> id.idText
let text_of_path: Prims.string Prims.list -> Prims.string =
  fun path  -> FStar_Util.concat_l "." path
let path_of_text: Prims.string -> Prims.string Prims.list =
  fun text  -> FStar_String.split ['.'] text
let path_of_ns: ident Prims.list -> Prims.string Prims.list =
  fun ns  -> FStar_List.map text_of_id ns
let path_of_lid: lident -> Prims.string Prims.list =
  fun lid  ->
    FStar_List.map text_of_id (FStar_List.append lid.ns [lid.ident])
let ids_of_lid: lident -> ident Prims.list =
  fun lid  -> FStar_List.append lid.ns [lid.ident]
let lid_of_ids: ident Prims.list -> lident =
  fun ids  ->
    let uu____102 = FStar_Util.prefix ids in
    match uu____102 with
    | (ns,id) ->
        let nsstr =
          let _0_130 = FStar_List.map text_of_id ns in
          FStar_All.pipe_right _0_130 text_of_path in
        {
          ns;
          ident = id;
          nsstr;
          str =
            ((match nsstr = "" with
              | true  -> id.idText
              | uu____112 -> Prims.strcat nsstr (Prims.strcat "." id.idText)))
        }
let lid_of_path: Prims.string Prims.list -> FStar_Range.range -> lident =
  fun path  ->
    fun pos  ->
      let ids = FStar_List.map (fun s  -> mk_ident (s, pos)) path in
      lid_of_ids ids
let text_of_lid: lident -> Prims.string = fun lid  -> lid.str
let lid_equals: lident -> lident -> Prims.bool =
  fun l1  -> fun l2  -> l1.str = l2.str
let ident_equals: ident -> ident -> Prims.bool =
  fun id1  -> fun id2  -> id1.idText = id2.idText
let range_of_lid: lid -> FStar_Range.range = fun lid  -> (lid.ident).idRange
let set_lid_range: lident -> FStar_Range.range -> lident =
  fun l  ->
    fun r  ->
      let uu___51_148 = l in
      {
        ns = (uu___51_148.ns);
        ident =
          (let uu___52_149 = l.ident in
           { idText = (uu___52_149.idText); idRange = r });
        nsstr = (uu___51_148.nsstr);
        str = (uu___51_148.str)
      }
let lid_add_suffix: lident -> Prims.string -> lident =
  fun l  ->
    fun s  ->
      let path = path_of_lid l in
      lid_of_path (FStar_List.append path [s]) (range_of_lid l)
let string_of_lid: lident -> Prims.string =
  fun lid  -> text_of_path (path_of_lid lid)