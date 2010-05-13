# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_system_atlas_session',
  :secret      => '0da00466a5e58b8d32756a9497f70da50c75534755a3416499b62ab9f53ccc9fe852e757bd9de48fe3a4c69886a0c97ea8d2ceeff430a97da80075c34fe5ee4b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
