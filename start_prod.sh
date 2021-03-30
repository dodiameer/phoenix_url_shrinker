export DATABASE_URL="ecto://postgres:dbpass@localhost/url_shrinker_prod"
export SECRET_KEY_BASE="aYvzuPZyNL9in3l8XGCGhAefkGUbz3EVf4R0NPaShfyEWfwcJiZN3ZjihldKqBLg"
export MIX_ENV=prod 
export PORT="4001"
mix ecto.setup
# mix phx.digest
mix phx.server
