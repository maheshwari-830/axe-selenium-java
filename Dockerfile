FROM maven:3.9.6-eclipse-temurin-11

WORKDIR /app

# Clone the repo into the container
RUN git clone https://github.com/maheshwari-830/axe-selenium-java.git .

# Build the project
RUN mvn clean install

# Run tests
CMD ["mvn", "test"]
