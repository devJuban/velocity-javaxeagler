FROM rust:latest
COPY . .
RUN cargo install bore-cli

#FROM eclipse-temurin:21-jdk
RUN chmod +x main.sh
CMD ["./main.sh"]