FROM alpine:latest

ENV MAILCATCHER_VERSION=0.7.1

LABEL maintainer="support@rebilly.com" \
    org.label-schema.name="mailcatcher" \
    org.label-schema.vendor="Rebilly" \
    org.label-schema.description="MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface." \
    org.label-schema.version="${MAILCATCHER_VERSION}" \
    org.label-schema.license="MIT"

RUN apk --no-cache --update add g++ make ruby ruby-dev ruby-json ruby-etc sqlite-dev \
    && gem install mailcatcher:${MAILCATCHER_VERSION} --no-ri --no-rdoc \
    && apk del g++ make

EXPOSE 1025 1080

CMD ["sh", "-c", "/usr/bin/env $(which mailcatcher) -f --ip=0.0.0.0 --foreground --no-quit"]
