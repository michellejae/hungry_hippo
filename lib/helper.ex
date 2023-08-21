defmodule Helper do
  @moduledoc """
  module that grabs all the config details for the resy
  """

  def fetch_goodies() do
    Application.fetch_env!(:hungry_hippo, Details)
    |> Enum.into(%{})
  end

end
