FROM rust:latest
COPY . .
RUN chmod +x main.sh
RUN cargo install bore-cli

FROM eclipse-temurin:21-jdk
RUN ./main.sh
CMD ["./main.sh"]