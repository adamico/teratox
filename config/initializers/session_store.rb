# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_teratox_session',
  :secret      => '59634e14c6431475598abe67b79ec84aa3dd025738d3ecc1af91b7ff4d62ac5bcefcceb809ce81b72a36afacf7d3e93c11a81178cdfdd58c8990371d3637fd57'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
