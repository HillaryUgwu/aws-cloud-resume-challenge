.PHONY: build

build:
	sam build

deploy-infra:
	sam build && sam deploy --no-confirm-changeset --no-fail-on-empty-changeset
# sam list stack-outputs --stack-name cloudResume > ./src/frontend/output.json

deploy-site:
	aws s3 sync ./src/frontend s3://www.ohary37.com

invoke-local:
	sam build && sam local invoke countFunction

invoke-remote:
	sam build && sam remote invoke countFunction