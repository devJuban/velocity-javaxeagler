FROM eclipse-temurin:21-jdk
FROM rust:latest
COPY . .
RUN chmod +x main.sh
RUN cargo install bore-cli
CMD ["./main.sh "]