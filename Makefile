DOCKER_RUN=docker run -v `pwd`:/app -w /app maven:3.5.3-jdk-8-slim
TARGET_DIR=languagetool-standalone/target/LanguageTool-4.2-SNAPSHOT/LanguageTool-4.2-SNAPSHOT

build:
	$(DOCKER_RUN) mvn clean test
	$(DOCKER_RUN) ./build.sh languagetool-standalone package -DskipTests
	cp Dockerfile.target $(TARGET_DIR)/Dockerfile 
	cp Makefile.target $(TARGET_DIR)/Makefile
	cd $(TARGET_DIR) && make build && make push

