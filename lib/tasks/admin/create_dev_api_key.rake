# Use this rake task to seed the api keys used for developement
namespace :admin do
  desc 'Creates the api keys for development'
  task create_dev_api_key: :environment do
    Mjolnir::Api::ApiKey.find_or_create_by(access_token: 'c6ca56e23356d1e5201b90a58de1f4c7') unless Rails.env.production?
  end
end
