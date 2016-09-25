# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
if Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    username == 'username' && password == 'password'
  end
end