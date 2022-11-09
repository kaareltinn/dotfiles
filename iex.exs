IEx.configure(
  colors: [
    enabled: true,
    eval_result: [:cyan, :bright],
    eval_error: [:light_magenta]
  ],
  default_prompt:
    [
      # a pale gold
      "\r\e[38;5;220m",
      # IEx context
      "%prefix",
      # forest green expression count
      "\e[38;5;112m(%counter)",
      # gold ">"
      "\e[38;5;220m>",
      # and reset to default color
      "\e[0m"
    ]
    # (1)
    |> IO.chardata_to_string()
)

defmodule Helpers do
  def copy(term) do
    text =
      if is_binary(term) do
        term
      else
        inspect(term, limit: :infinity, pretty: true)
      end

    port = Port.open({:spawn, "pbcopy"}, [])
    true = Port.command(port, text)
    true = Port.close(port)

    :ok
  end
end
