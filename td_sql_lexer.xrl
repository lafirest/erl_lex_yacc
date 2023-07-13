Definitions.

WORD = [0-9a-zA-Z${}._]*
ASTR = '[^']+'
DSTR = "[^"]+"
WHITE = [\s\t\n\r]+

Rules.

[iI][nN][sS][eE][rR][tT] : {token, {tk_insert}}.
[iI][nN][tT][oO] : {token, {tk_into}}.
[uU][sS][iI][nN][gG] : {token, {tk_using}}.
[tT][aA][gG][sS] : {token, {tk_tags}}.
[vV][aA][lL][uU][eE][sS] : {token, {tk_values}}.
{WORD} : {token, {word, TokenChars}}.
\( : {token, {left_bracket}}.
\) : {token, {right_bracket, ""}}.
{ASTR} : {token, {word, strip(TokenChars, "'")}}.
{DSTR} : {token, {word, strip(TokenChars, "\"")}}.
, : skip_token.
{WHITE} : skip_token.

Erlang code.

strip(Str, Chars) ->
    string:trim(Str, both, Chars).
