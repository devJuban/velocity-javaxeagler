FROM rust:latest as rust-build

FROM eclipse-temurin:21-jdk as jdk-build

RUN apt-get update && \
    apt-get install -y curl && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


COPY . .

RUN cargo install bore-cli

EXPOSE 14457

RUN chmod +x main.sh 

CMD ["./main.sh"]