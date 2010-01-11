# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eventCalendar_session',
  :secret      => 'a277f061e1e35443d4f99cbc7c0a7c5eaedf37341e46cc70eaf06fc5569a9ffbc1a078e7f113dfc7be53488ad71dab344b56b41801f1fd0d53e8be8971dc95ee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
