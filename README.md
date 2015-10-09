# tlnbot docker
Docker container to run hubot for slack.

### Running the docker container
```
# build the docker image
$ cd tlnbot-docker
$ docker build -t learningnet/tlnbot .

# run the image
docker run --name tlnbot -e HUBOT_SLACK_TOKEN=xxx -d learningnet/tlnbot
```