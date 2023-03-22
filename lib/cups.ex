defmodule Hippy.Cups do
  use Rustler,
    otp_app: :hippy,
    crate: :hippy_cups

  alias Hippy.Cups.PrinterInformation

  def get_printers(uri) do
    case do_get_printers(uri) do
      {:ok, printers} ->
        server_uri = URI.parse(uri)

        Enum.map(printers, &adjust_printer_uri(&1, server_uri))

      printers ->
        server_uri = URI.parse(uri)

        Enum.map(printers, &adjust_printer_uri(&1, server_uri))
    end
  end

  # When loading a NIF module, dummy clauses for all NIF function are required.
  # NIF dummies usually just error out when called when the NIF is not loaded, as that should never normally happen.
  def do_get_printers(uri) when is_binary(uri), do: error()

  # Default error when NIF is not loaded
  defp error, do: :erlang.nif_error(:nif_not_loaded)

  defp adjust_printer_uri(
         %PrinterInformation{printer_uri: printer_uri} = printer_information,
         %URI{host: host}
       ) do
    # Get the printer URI but replace the host with the server host.
    # We do this because the server returns 127.0.0.1 as the hostname.
    uri =
      %{URI.parse(printer_uri) | host: host}
      |> IO.inspect()

    %{printer_information | printer_uri: to_string(uri)}
  end
end
