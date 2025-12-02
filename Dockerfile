FROM rust:latest
RUN cargo install bore-cli
COPY . .

FROM eclipse-temurin:21-jdk
COPY . .
RUN chmod +x main.sh
CMD ["./main.sh"]