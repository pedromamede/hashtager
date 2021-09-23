require 'aws-sdk-rekognition'

class Hashtager

  def self.test
    client = Aws::Rekognition::Client.new(
      region:  ENV['AWS_REGION'] || 'us-east-1',
      access_key_id: ENV['AWS_ACCESS_KEY_ID'], 
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    )

    photo = 'photo.jpg'
    path = File.expand_path(photo)
    file = File.read(path)

    resp = client.detect_labels({
      image: {
        bytes: file
      }, 
      max_labels: 30, 
      min_confidence: 70, 
    })

    resp.labels.each do |label|
      p '========='
      p label.name
      p label.confidence
      p '========='
    end
  end
end