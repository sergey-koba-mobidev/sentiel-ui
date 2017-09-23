require 'aws-sdk'

module Web::Controllers::Sentinels
  class Choose
    include Web::Action
    expose :sentinels

    def call(params)
      # Hanami.logger.debug ENV['REGION_NAME']
      s3 = Aws::S3::Client.new(
          region: ENV['REGION_NAME'],
          access_key_id: ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
          endpoint: ENV['ENDPOINT_URL']
      )
      @sentinels = s3.list_objects(bucket: ENV['BUCKET'], prefix: 'sentiels/', delimiter: '/').common_prefixes.map(&:prefix)
    end
  end
end
