require 'aws-sdk-rekognition'

class Hashtager

  def self.get_labels filename
    client = Aws::Rekognition::Client.new(
      region:  ENV['HASHTAGER_AWS_REGION'] || 'us-east-1',
      access_key_id: ENV['HASHTAGER_AWS_ACCESS_KEY_ID'], 
      secret_access_key: ENV['HASHTAGER_AWS_SECRET_ACCESS_KEY']
    )

    path = File.expand_path("public/#{filename}")
    file = File.read(path)

    resp = client.detect_labels({
      image: {
        bytes: file
      }, 
      max_labels: 30, 
      min_confidence: 50, 
    })
    
    resp.labels.map do |label|
      {name: label.name, confidence: label.confidence}
    end
  end
end