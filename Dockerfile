# ---------- Stage 1: compile the project ----------
FROM maven:3.8.6-openjdk-11-slim AS build   # ✔️ tag exists on Docker Hub :contentReference[oaicite:0]{index=0}
WORKDIR /app

# If the repo is already on the host, copy it; otherwise git-clone.
COPY . .
# Or: RUN apt-get update && apt-get install -y git && \
#     git clone https://github.com/maheshwari-830/axe-selenium-java.git .

# Compile everything, but don’t launch the UI tests
RUN mvn -B clean package -DskipTests

# ---------- Stage 2: runtime / test stage ----------
# Use Selenium’s official image so a headless Chrome + Chromedriver is present
FROM selenium/standalone-chrome:4.21.0-20240509
USER root                        # allow Maven to create ~/.m2
WORKDIR /workspace

# Bring the compiled artefacts and pom.xml into this stage
COPY --from=build /app .

# Default action: run the tests
CMD ["mvn", "-q", "test"]
