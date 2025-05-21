FROM maven:3.8.7-openjdk-11
WORKDIR /app
RUN git clone https://github.com/maheshwari-830/axe-selenium-java.git .
RUN mvn clean install
CMD ["mvn", "test"]
