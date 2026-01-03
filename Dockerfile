FROM eclipse-temurin:21-jdk
RUN apt-get update
RUN curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
RUN echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | tee /etc/apt/sources.list.d/playit-cloud.list
RUN apt-get update
RUN apt-get install playit -y
COPY . .
RUN chmod +x main.sh
CMD ["./main.sh"]