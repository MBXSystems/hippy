defmodule Hippy.Cups.PrinterInformation do
  defstruct [:name, :printer_uri]

  @type t :: %__MODULE__{
          name: String.t(),
          printer_uri: String.t()
        }
end
