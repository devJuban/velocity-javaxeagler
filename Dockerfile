FROM eclipse-temurin:21-jdk
FROM rust:latest
COPY . .
EXPOSE 14457
RUN cargo install bore-cli
RUN chmod +x main.sh
CMD ["./main.sh"]