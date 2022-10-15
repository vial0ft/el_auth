defmodule ElAuth.Guardian.AuthPipeline do
@claims %{typ: "access"}

use Guardian.Plug.Pipeline,
    otp_app: :el_auth,
    module: ElAuth.Guardian,
    error_handler: ElAuth.Guardian.ErrorHandler


    plug(Guardian.Plug.VerifyHeader, claims: @claims, scheme: "Bearer")
    plug(Guardian.Plug.EnsureAuthenticated)
    plug(Guardian.Plug.LoadResource, ensure: true)
end
