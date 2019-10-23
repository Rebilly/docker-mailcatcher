# MailCatcher Docker Image

[MailCatcher](https://mailcatcher.me/) runs a super simple SMTP server
which catches any message sent to it to display in a web interface.

## Installation

Pull the image from the [GitHub Package Registry](https://github.com/Rebilly/docker-mailcatcher/packages/42492).
This is the recommended method of installation as it is easier to update image.

```bash
docker pull docker.pkg.github.com/rebilly/docker-mailcatcher/mailcatcher:latest
```

Build the image locally

```bash
git clone git@github.com:Rebilly/docker-mailcatcher.git 
cd docker-mailcatcher
docker build -t docker.pkg.github.com/rebilly/docker-mailcatcher/mailcatcher:latest .
```

## Quick start

Using `docker-compose.yml`

```yaml
services:
  mailcatcher:
    restart: on-failure:10
    image: docker.pkg.github.com/rebilly/docker-mailcatcher/mailcatcher:latest
    ports:
    - "1080:1080"
    - "1025:1025"
```

Alternately, you can manually launch the mailcatcher container.

```bash
docker run --name='mailcatcher' -d --publish=1080:1080 --publish=1025:1025 \
    docker.pkg.github.com/rebilly/docker-mailcatcher/mailcatcher:latest
```

# Publish changes

The image is hosted on [GitHub Package Registry](https://github.com/Rebilly/docker-mailcatcher/packages/42492).

Read the [Configuring Docker for use with GitHub Package Registry](https://help.github.com/en/github/managing-packages-with-github-package-registry/configuring-docker-for-use-with-github-package-registry) 
to learn how to publish new version of image.

There is an example:

```bash
docker login docker.pkg.github.com -u USERNAME -p TOKEN
docker build -t docker.pkg.github.com/rebilly/docker-mailcatcher/mailcatcher:latest .
docker push docker.pkg.github.com/rebilly/docker-mailcatcher/mailcatcher:latest
```
