FROM eclipse-temurin:21-jdk
FROM rust:latest
COPY . .
RUN chmod +x main.sh
CMD ["./main.sh "]