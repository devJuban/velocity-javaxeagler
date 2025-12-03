FROM rust:latest
COPY . .
RUN chmod +x main.sh
RUN cargo install bore-cli


RUN ./main.sh
FROM eclipse-temurin:21-jdk
CMD ["./main.sh"]