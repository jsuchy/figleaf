# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fig_leaf_session',
  :secret      => '65b60804c47875b39e123510b7dc0cfe166020498f0770f24c6feaeb76815dbd4df84a3ee37d810b9e91384055c5cd23d02e065dea20b94f68356bc3bd5535a0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
