CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJEBTNTTEHI66HCUA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'fakebook-box'                          # required
end