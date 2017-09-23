require 'aws-sdk'

module Web::Controllers::Sentinels
  class PicturesDay
    include Web::Action
    expose :sentinel
    expose :day
    expose :pictures
    expose :common_url

    def call(params)
      # Hanami.logger.debug ENV['REGION_NAME']
      s3 = Aws::S3::Client.new(
          region: ENV['REGION_NAME'],
          access_key_id: ENV['AWS_ACCESS_KEY_ID'],
          secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
          endpoint: ENV['ENDPOINT_URL']
      )
      @sentinel = params[:sentinel_name]
      @day = params[:day]
      @common_url = "https://#{ENV['BUCKET']}.#{ENV['ENDPOINT_URL'].gsub('https://', '')}"
      @pictures = s3.list_objects(bucket: ENV['BUCKET'], prefix: "#{ENV['PREFIX']}/#{@sentinel}/pictures/#{@day}/thumbnails/")
                      .contents
                      .sort {|a,b| b.last_modified <=> a.last_modified}
    end
  end
end
