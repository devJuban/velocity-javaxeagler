FROM rust:latest
COPY . .
RUN cargo install bore-cli

FROM eclipse-temurin:21-jdk
COPY . .
RUN chmod +x main.sh

CMD ["./main.sh", "&&", "bore", "local", "14457", "--to", "bore.pub"]