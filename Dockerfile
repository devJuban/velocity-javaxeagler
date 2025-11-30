FROM eclipse-temurin:21-jdk
FROM bash:latest
FROM ekzhang/bore:latest
COPY . .
RUN chmod +x main.sh
CMD ["./main.sh"]