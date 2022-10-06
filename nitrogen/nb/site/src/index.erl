%% -*- mode: nitrogen -*-
-module (index).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("nb.hrl").



main() -> #template { file="./site/templates/bare.html" }.

title() -> "Welcome to Nitrogen".

body() ->
    [ #h1 { text="WELCOME!!!!"},
        #h2 { text="Testing auto save" }
        #list{numbered=false, body=format_visitors(Visitors)},
        #br{}
    ].


format_visitors(List) ->
    [format_visitor(X) || X <- List].

format_visitor(Visitor) ->
    Name = visitors_db:format_name(Visitor),
    #listitem{text=Name, class="visitors"}.
