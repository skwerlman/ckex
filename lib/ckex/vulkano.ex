defmodule CKEX.Vulkano do
  use Rustler, otp_app: :ckex, crate: "ckex_vulkano"

  # When your NIF is loaded, it will override this function.
  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
