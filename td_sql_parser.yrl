Nonterminals
insert tb_descs tb_desc using_desc fields_desc values_desc value_list parameters parameter_units.

Terminals
tk_insert tk_into tk_using tk_tags tk_values word left_bracket right_bracket.

Rootsymbol insert.

insert ->
    tk_insert tk_into tb_descs : {insert, '$3'}.

tb_descs -> tb_desc : ['$1'].
tb_descs -> tb_desc tb_descs : ['$1' | '$2'].

tb_desc -> word using_desc fields_desc values_desc : {tb, '$1', '$2', '$3', '$4'}.
tb_desc -> word using_desc values_desc : {tb, '$1', '$3'}.
tb_desc -> word fields_desc values_desc : {tb, '$1', '$3'}.
tb_desc -> word values_desc : {tb, '$1'}.

using_desc -> tk_using word parameters tk_tags parameters : {using, '$2', '$3', '%5'}.
using_desc -> tk_using word tk_tags parameters : {using, '$2', '$4'}.

fields_desc -> parameters : {fields, '$1'}.

values_desc -> tk_values value_list : {values, '$2'}.

value_list -> parameters : ['$1'].
value_list -> parameters value_list : ['$1' | '$2'].

parameters ->
    left_bracket parameter_units right_bracket: {parameters, make_paramaters('$2')}.

parameter_units -> word : ['$1'].
parameter_units -> word parameter_units : ['$1' | '$2'].

Erlang code.

make_paramaters(List) ->
    string:join([Word || {word, Word} <- List], ",").
