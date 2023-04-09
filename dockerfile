# Set the base image
FROM openjdk:8-jre

# Install Chrome browser and chromedriver
RUN apt-get update && apt-get install -y curl gnupg
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install -y google-chrome-stable
RUN LATEST=`curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    curl -sSL https://chromedriver.storage.googleapis.com/$LATEST/chromedriver_linux64.zip > /tmp/chromedriver.zip && \
    unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# Create and set the working directory
WORKDIR /app

# Copy the pom.xml and src directories
COPY pom.xml .
COPY src ./src

# Install dependencies and run the tests
RUN apt-get update && apt-get install -y maven
RUN mvn clean install -DskipTests=true
CMD mvn test

