%%
%% url: http://server/getprompt/id/prompt_id
%%

-module(controller_getprompt).
-export([
    service_available/1,
    allowed_methods/1,
    resource_exists/1,
    forbidden/1,
    content_types_provided/1,
    charsets_provided/1,
    encodings_provided/1,
    provide_content/1,
    finish_request/1
]).

-include_lib("zotonic.hrl").
-include("../include/mod_kazoo.hrl").

service_available(Context0) ->
    Context = z_context:set_noindex_header(Context0),
    Context1 = z_context:continue_session(z_context:ensure_qs(Context)),
    DocId = z_context:get_q('id', Context1),
    case byte_size(?TO_BIN(kazoo_util:kz_get_account_prompt_attachment(DocId, Context1))) of
        0 -> {false, Context1};
        N when is_integer(N) ->
            PromptDoc = kazoo_util:kz_get_account_prompt(DocId, Context1),
            Mime = z_media_identify:guess_mime(modkazoo_util:get_value(<<"description">>,PromptDoc)),
            ContextMime = z_context:set(mime, Mime, Context1),
            ContextSize = z_context:set([{file_size, N}], ContextMime), 
            {true, ContextSize};
        _ ->
            {false, Context1}
    end.

allowed_methods(Context) ->
    {[<<"HEAD">>, <<"GET">>], Context}.

forbidden(Context) ->
    case z_context:get_q('id', Context) of
        <<DocId:32>> ->
            case kazoo_util:kz_get_account_prompt_attachment(DocId, Context) of
                 <<"">> ->
                     {true, Context};
                 _ ->
                     {false, Context}
            end;
        _ ->
            {true, Context}
    end.

content_types_provided(Context) ->
    {[{z_context:get(mime, Context), provide_content}], Context}.

encodings_provided(Context) ->
    Mime = z_context:get(mime, Context),
    Encodings = case z_media_identify:is_mime_compressed(Mime) of
        true -> [{<<"identity">>, fun(Data) -> Data end}];
        _    -> [{<<"identity">>, fun(Data) -> decode_data(identity, Data) end}
                ,{<<"gzip">>, fun(Data) -> decode_data(gzip, Data) end}]
    end,
    {Encodings, z_context:set(encode_data, length(Encodings) > 1, Context)}.

resource_exists(Context) ->
    DocId = z_context:get_q('id', Context),
    {kazoo_util:kz_get_account_prompt_attachment(DocId, Context) =/= <<>>, Context}.

charsets_provided(Context) ->
    case is_text(z_context:get(mime, Context)) of
        true -> {[{<<"utf-8">>, fun(X) -> X end}], Context};
        _ -> {no_charset, Context}
    end.
    
provide_content(Context0) ->
    DocId = z_context:get_q('id', Context0),
    FileName = <<DocId/binary, (?TO_BIN(z_media_identify:extension(z_context:get(mime, Context0),".mp3")))/binary>>,
    Context = case z_context:get(content_disposition, Context0) of
                  inline ->
                      z_context:set_resp_header(<<"content-disposition">>
                                               ,<<"inline; filename=", FileName/binary>>
                                               ,Context0);
                  attachment ->
                      z_context:set_resp_header(<<"content-disposition">>
                                               ,<<"attachment; filename=", FileName/binary>>
                                               ,Context0);
                  undefined ->  Context0
              end,
    case z_context:get(body, Context) of
        undefined ->
            Data = ?TO_BIN(kazoo_util:kz_get_account_prompt_attachment(DocId, Context)),
            Body = case z_context:get(encode_data, Context, false) of 
                true -> encode_data(Data);
                false -> Data
            end,
            {Body, z_context:set(body, Body, Context)};
        Body -> 
            {Body, Context}
    end.
    
finish_request(Context) ->
    {ok, Context}.

%%%%%%%%%%%%%% Helper functions %%%%%%%%%%%%%%

%% @spec is_text(Mime) -> bool()
%% @doc Check if a mime type is textual
is_text("text/" ++ _) -> true;
is_text("application/x-javascript") -> true;
is_text("application/xhtml+xml") -> true;
is_text("application/xml") -> true;
is_text(_Mime) -> false.

%% Encode the data so that the identity variant comes first and then the gzip'ed variant
encode_data(Data) when is_binary(Data) ->
    {Data, zlib:gzip(Data)}.

decode_data(gzip, Data) when is_binary(Data) ->
    zlib:gzip(Data);
decode_data(identity, Data) when is_binary(Data) ->
    Data;
decode_data(identity, {Data, _Gzip}) ->
    Data;
decode_data(gzip, {_Data, Gzip}) ->
    Gzip.
