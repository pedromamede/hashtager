require 'aws/rekognition'
require 'dotenv'
Dotenv.load

class Hashtager
  client = Aws::Rekognition::Client.new(
    region:  ENV[AWS_REGION] || 'us-east-1',
    credentials: { access_key_id: ENV[AWS_ACCESS_KEY_ID], secret_access_key: ENV[AWS_SECRET_ACCESS_KEY]}
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

  
end