defmodule InfoSys.Backend do
  @callback name() :: String.t()
  @callback compute(query :: String.t(), opts :: Keyword.t()) :: list(InfoSys.Result.t())
end
