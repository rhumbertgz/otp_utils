-module(otp_utils).

%% API exports
-export([get_otp_version/0, get_current_time/0]).

%%====================================================================
%% API functions
%%====================================================================

%% @doc
%% This function returns version number of Erlang (OTP)
%% @end
get_otp_release() ->
  {Vs,_} = string:to_integer(erlang:system_info(otp_release)),
  Vs.

%% @doc
%% This function returns retrieve current Erlang system time
%% in the same format as returned by erlang:now/0
%% @end
get_current_time() ->
  case get_opt_version() >= 18 of
    true -> erlang:timestamp();
    _    -> erlang:now()
  end.
%%====================================================================
%% Internal functions
%%====================================================================
