FROM rust:latest
RUN cargo install bore-cli

COPY . .

FROM eclipse-temurin:21-jdk
RUN chmod +x main.sh

CMD ["./main.sh"]