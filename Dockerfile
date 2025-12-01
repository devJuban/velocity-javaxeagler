FROM rust:latest
FROM eclipse-temurin:21-jdk
COPY . .
RUN cargo install bore-cli
EXPOSE 14457
RUN chmod +x main.sh
CMD ["./main.sh"]