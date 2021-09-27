# hashtager

- Upload your image and get automatic hash tags for it

- This project uses Sinata (simple and lighweight ruby web application lib) and Rekognition (AWS service that use deep neural network models to detect and label objects and scenes in your images)


## Dependencies

- Ruby 3.x
- Sinatra
- Bundler
- AWS Account credentials (Warning: this project use the detect label feature from rekognition service, it's not free of charge, at the moment this app was written AWS allows 5k images montly for free)

  

## Development Setup

  

- Create a .env file\

`touch .env`


- Add these lines to the .env file

HASHTAGER_AWS_REGION=us-east-1
HASHTAGER_AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY
HASHTAGER_AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY

- Run bundler

`bundle`

- Run sinatra server

`ruby app.rb`

- Access the app page at http://localhost:4567\

  

## About the AWS Account/User

- Create a IAM user with the follow permission attached:

```json
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": "rekognition:DetectLabels",
			"Resource": "*"
		}
	]
}
```

- Beware: If you have a credential set as an environment variable, it takes precedence over the credentials set on the .env file