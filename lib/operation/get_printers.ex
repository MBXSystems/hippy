defmodule Hippy.Operation.GetPrinters do
  @moduledoc """
  Represents a request to get print jobs for a printer on the IPP server.
  """

  @def_charset "utf-8"
  @def_lang "en"
  @def_atts ["printer-uri-supported"]

  defstruct charset: @def_charset,
            language: @def_lang,
            requested_attributes: @def_atts,
            printer_uri: nil

  def new(server_uri, opts \\ []) do
    %__MODULE__{
      printer_uri: server_uri,
      charset: Keyword.get(opts, :charset, @def_charset),
      language: Keyword.get(opts, :language, @def_lang),
      requested_attributes: Keyword.get(opts, :requested_attributes, @def_atts)
    }
  end
end

defimpl Hippy.Operation, for: Hippy.Operation.GetPrinters do
  def build_request(op) do
    %Hippy.Request{
      # Should request_id be a parameter to build_request?
      request_id: System.unique_integer([:positive, :monotonic]),
      operation_id: Hippy.Protocol.Operation.cups_get_printers(),
      operation_attributes: [
        {:charset, "attributes-charset", op.charset},
        {:natural_language, "attributes-natural-language", op.language},
        {{:set1, :keyword}, "requested-attributes", op.requested_attributes}
      ],
      data: <<>>
    }
  end
end
