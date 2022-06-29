defmodule Hippy.Request do
  defstruct version: Hippy.IPPVersion.new(1, 0),
            operation_id: nil,
            request_id: nil,
            operation_attributes: [],
            job_attributes: [],
            data: nil
end
