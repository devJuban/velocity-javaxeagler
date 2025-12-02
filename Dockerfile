FROM rust:latest
RUN cargo install bore-cli
COPY . .

RUN chmod +x main.sh

FROM eclipse-temurin:21-jdk
COPY . .
CMD ["./main.sh"]