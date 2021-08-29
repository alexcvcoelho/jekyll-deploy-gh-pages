# Our Docker image will be based on ruby:2-slim
# it is a very light docker image.
FROM ruby:2.6.3
LABEL author="Alex Coelho"
LABEL version="1.0.0"

# Lets install all dependencies
# including git and Bundler 2.1.4
ENV BUNDLER_VERSION 2.2
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    curl \
    make \
    shellcheck \
    git-all \
    && gem install bundler:2.2 \
    && bundle config --global silence_root_warning 1

# This is our entrypoint to our custom scripts
# more about that in a sec
COPY entrypoint.sh /

# Use the entrypoint.sh file as the container entrypoint
# when Github executes our Docker container
ENTRYPOINT ["sh", "/entrypoint.sh"]
