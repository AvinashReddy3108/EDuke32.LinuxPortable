# Set the base image to use for subsequent instructions
FROM registry.gitlab.steamos.cloud/steamrt/scout/sdk:latest

# Install dependencies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential gcc-9-monolithic \
                       nasm \
                       libgl1-mesa-dev \
                       libsdl2-dev \
                       flac libflac-dev \
                       libvpx-dev \
                       libgtk2.0-dev \
                       freepats

# Copy any source file(s) required for the action
COPY entrypoint.sh /entrypoint.sh

# Set the working directory inside the container
WORKDIR /github/workspace

# Configure the container to be run as an executable
ENTRYPOINT ["/entrypoint.sh"]
