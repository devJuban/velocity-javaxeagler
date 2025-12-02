FROM rust:latest
COPY . .

RUN cargo install bore-cli
RUN chmod +x main.sh

FROM eclipse-temurin:21-jdk
CMD ["./main.sh"]