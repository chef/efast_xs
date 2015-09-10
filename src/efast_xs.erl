-module(efast_xs).

-export([escape/1]).
-on_load(init/0).

init() ->
    PrivDir = case code:priv_dir(?MODULE) of
        {error, _} ->
            EbinDir = filename:dirname(code:which(?MODULE)),
            AppPath = filename:dirname(EbinDir),
            filename:join(AppPath, "priv");
        Path ->
            Path
    end,
    ok = erlang:load_nif(filename:join(PrivDir, "efast_xs"), 0).

-spec escape(binary()) -> binary().
escape(_X) ->
    erlang:nif_error(nif_library_not_loaded).
