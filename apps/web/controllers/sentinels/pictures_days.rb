require 'aws-sdk'

module Web::Controllers::Sentinels
  class PicturesDays
    include Web::Action
    expose :sentinel
    expose :days

    def call(params)
      # Hanami.logger.debug ENV['REGION_NAME']
      s3 = Aws::S3::Client.new(
          region: ENV['REGION_NAME'],
          access_key_id: ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
          endpoint: ENV['ENDPOINT_URL']
      )
      @sentinel = params[:sentinel_name]
      @days = s3.list_objects(bucket: ENV['BUCKET'], prefix: "#{ENV['PREFIX']}/#{@sentinel}/pictures/", delimiter: '/')
                       .common_prefixes
                       .map{ |c| c.prefix.gsub("#{ENV['PREFIX']}/#{@sentinel}/pictures/", '').gsub('/', '') }
    end
  end
end
