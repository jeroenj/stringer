require "airbrake"

Airbrake.configure do |config|
  config.project_id = ENV["AIRBRAKE_PROJECT_ID"].to_i
  config.project_key = ENV["AIRBRAKE_PROJECT_KEY"]
  config.host = ENV["AIRBRAKE_HOST"]
  config.environment = ENV["RACK_ENV"] || "development"
  config.ignore_environments = %w[development test]
end
