FROM eclipse-temurin:21-jdk
COPY . .
RUN chmod +x main.sh
RUN ./main.sh

FROM rust:latest
RUN cargo install bore-cli
CMD ["bore", "local", "14457", "--to", "bore.pub"]