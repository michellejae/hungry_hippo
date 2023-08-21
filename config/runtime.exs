import Config
import Dotenvy

source!([".env", System.get_env()])


config :hungry_hippo, Details,
date: "2023-08-25",
party_size: 2,
venue_id: 54325,
lat: 0,
long: 0

config :hungry_hippo,
url: "https://api.resy.com",
api_key: env!("KEY", :string),
auth_token: env!("TOKEN", :string)
