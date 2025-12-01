FROM rust:latest
COPY . .
EXPOSE 14457
RUN cargo install bore-cli
FROM eclipse-temurin:21-jdk
RUN chmod +x main.sh
CMD ["./main.sh"]