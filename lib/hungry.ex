defmodule Hungry do
  use Tesla, only: [:get], docs: false

  plug Tesla.Middleware.BaseUrl, Application.fetch_env!(:hungry_hippo, :url)
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.Headers, [{"authorization", Application.fetch_env!(:hungry_hippo, :api_key)}]

  adapter(Tesla.Adapter.Hackney)

  def hello do
    goodies = Hungry.fetch_goodies
    Hungry.call(goodies.venue_id, goodies.party_size, goodies.date)
  end


  def call(venue_id, party_size, date) do
    {:ok, response} = Hungry.get(venue_id, party_size,date)
    slots = List.first(response.body["results"]["venues"])["slots"]
    index = Hungry.find_time(slots)
    Hungry.find_slot(slots, index)
  end


  ## find
  def get(venue_id, party_size, date) do
    get("4/find?lat=0&long=0&day=#{date}&party_size=#{party_size}&venue_id=#{venue_id}&time_filter=21:00&limit=2")
  end


  # def call (venue_id, party_size, date, config) do

  # end

  def find_slot(slots, index) do
    Enum.fetch!(slots, index)
    |> Map.fetch!("config")
    |> Map.fetch!("token")
  end

 def find_time (slots) do
   Enum.map(slots, fn slot -> slot["date"]["start"] end)
    |> Enum.map(fn x -> String.split(x) end)
    |> Enum.map(fn y -> List.last(y) end)
    |> Enum.find_index(fn z -> z == "21:00:00" end)
  end

  def fetch_goodies() do
    Application.fetch_env!(:hungry_hippo, Details)
    |> Enum.into(%{})
  end




end
