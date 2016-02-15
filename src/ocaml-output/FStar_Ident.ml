
open Prims
# 5 "FStar.Ident.fst"
type ident =
{idText : Prims.string; idRange : FStar_Range.range}

# 5 "FStar.Ident.fst"
let is_Mkident : ident  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkident"))))

# 8 "FStar.Ident.fst"
type lident =
{ns : ident Prims.list; ident : ident; nsstr : Prims.string; str : Prims.string}

# 8 "FStar.Ident.fst"
let is_Mklident : lident  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mklident"))))

# 13 "FStar.Ident.fst"
type lid =
lident

# 15 "FStar.Ident.fst"
let mk_ident : (Prims.string * FStar_Range.range)  ->  ident = (fun _21_11 -> (match (_21_11) with
| (text, range) -> begin
{idText = text; idRange = range}
end))

# 16 "FStar.Ident.fst"
let gen : FStar_Range.range  ->  ident = (
# 17 "FStar.Ident.fst"
let x = (FStar_ST.alloc 0)
in (fun r -> (
# 18 "FStar.Ident.fst"
let _21_14 = (let _100_25 = ((FStar_ST.read x) + 1)
in (FStar_ST.op_Colon_Equals x _100_25))
in (let _100_29 = (let _100_28 = (let _100_27 = (let _100_26 = (FStar_ST.read x)
in (Prims.string_of_int _100_26))
in (Prims.strcat "@x_" _100_27))
in (_100_28, r))
in (mk_ident _100_29)))))

# 19 "FStar.Ident.fst"
let id_of_text : Prims.string  ->  ident = (fun str -> (mk_ident (str, FStar_Range.dummyRange)))

# 20 "FStar.Ident.fst"
let text_of_id : ident  ->  Prims.string = (fun id -> id.idText)

# 21 "FStar.Ident.fst"
let text_of_path : Prims.string Prims.list  ->  Prims.string = (fun path -> (FStar_Util.concat_l "." path))

# 22 "FStar.Ident.fst"
let path_of_text : Prims.string  ->  Prims.string Prims.list = (fun text -> (FStar_String.split (('.')::[]) text))

# 23 "FStar.Ident.fst"
let path_of_ns : ident Prims.list  ->  Prims.string Prims.list = (fun ns -> (FStar_List.map text_of_id ns))

# 24 "FStar.Ident.fst"
let path_of_lid : lident  ->  Prims.string Prims.list = (fun lid -> (FStar_List.map text_of_id (FStar_List.append lid.ns ((lid.ident)::[]))))

# 25 "FStar.Ident.fst"
let ids_of_lid : lident  ->  ident Prims.list = (fun lid -> (FStar_List.append lid.ns ((lid.ident)::[])))

# 26 "FStar.Ident.fst"
let lid_of_ids : ident Prims.list  ->  lident = (fun ids -> (
# 27 "FStar.Ident.fst"
let _21_26 = (FStar_Util.prefix ids)
in (match (_21_26) with
| (ns, id) -> begin
(
# 28 "FStar.Ident.fst"
let nsstr = (let _100_46 = (FStar_List.map text_of_id ns)
in (FStar_All.pipe_right _100_46 text_of_path))
in {ns = ns; ident = id; nsstr = nsstr; str = if (nsstr = "") then begin
id.idText
end else begin
(Prims.strcat (Prims.strcat nsstr ".") id.idText)
end})
end)))

# 33 "FStar.Ident.fst"
let lid_of_path : Prims.string Prims.list  ->  FStar_Range.range  ->  lident = (fun path pos -> (
# 34 "FStar.Ident.fst"
let ids = (FStar_List.map (fun s -> (mk_ident (s, pos))) path)
in (lid_of_ids ids)))

# 36 "FStar.Ident.fst"
let text_of_lid : lident  ->  Prims.string = (fun lid -> lid.str)

# 37 "FStar.Ident.fst"
let lid_equals : lident  ->  lident  ->  Prims.bool = (fun l1 l2 -> (l1.str = l2.str))

# 38 "FStar.Ident.fst"
let lid_with_range : lid  ->  FStar_Range.range  ->  lident = (fun lid r -> (
# 39 "FStar.Ident.fst"
let id = (
# 39 "FStar.Ident.fst"
let _21_37 = lid.ident
in {idText = _21_37.idText; idRange = r})
in (
# 40 "FStar.Ident.fst"
let _21_40 = lid
in {ns = _21_40.ns; ident = id; nsstr = _21_40.nsstr; str = _21_40.str})))

# 41 "FStar.Ident.fst"
let range_of_lid : lid  ->  FStar_Range.range = (fun lid -> lid.ident.idRange)

# 42 "FStar.Ident.fst"
let set_lid_range : lident  ->  FStar_Range.range  ->  lident = (fun l r -> (
# 43 "FStar.Ident.fst"
let ids = (FStar_All.pipe_right (FStar_List.append l.ns ((l.ident)::[])) (FStar_List.map (fun i -> (mk_ident (i.idText, r)))))
in (lid_of_ids ids)))



