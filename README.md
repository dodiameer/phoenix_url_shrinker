# Phoenix URL Shrinker

A simple URL shrinker built with Phoenix Framework for Elixir

## Features

- POST to `/api/urls/shrink` to shrink a URL, no authentication required
- Uses ConCache to store results in memory
- Same hash is given for the same URL, saving-up on space in the database

## Development

To start the server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
