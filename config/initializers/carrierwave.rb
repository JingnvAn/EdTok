
# CarrierWave.configure do |config|
#     config.fog_provider = 'fog/aws'                        # required
#     config.fog_credentials = {
#       provider:              'AWS',                        # required
#       aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
#       aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
#     }
#     config.fog_directory  = ENV["AWS_BUCKET"]              # required
#   end

CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
      :aws_secret_access_key  => ENV["AWS_SECRET_KEY"],                        # required
      :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'
      #:host                   => "s3-us-west-1.amazonaws.com",
    }
    config.fog_directory  = ENV["AWS_BUCKET"]                      # required
  end