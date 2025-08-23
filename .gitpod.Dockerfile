# Start with a base image that has common tools
FROM gitpod/workspace-full

# Install Python and dependencies
RUN sudo apt-get update && sudo apt-get install -y python3 python3-pip
RUN pip3 install --upgrade pip

# Install Node.js, npm, and TypeScript
# The base image may have Node.js, but this ensures a specific version
RUN curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN sudo npm install -g typescript

# Install .NET SDK for C#
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN sudo dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0

# Install Scala (via SDKMAN!)
RUN curl -s "https://get.sdkman.io" | bash
RUN /bin/bash -c "source \"$HOME/.sdkman/bin/sdkman-init.sh\" && sdk install scala"
# Install sbt (Scala build tool)
RUN /bin/bash -c "source \"$HOME/.sdkman/bin/sdkman-init.sh\" && sdk install sbt"

# Install Groovy (via SDKMAN!)
RUN /bin/bash -c "source \"$HOME/.sdkman/bin/sdkman-init.sh\" && sdk install groovy"

# Set the working directory
WORKDIR /workspace
