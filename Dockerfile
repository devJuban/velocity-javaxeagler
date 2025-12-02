FROM rust:latest
RUN cargo install bore-cli


#FROM eclipse-temurin:21-jdk
#COPY . .
RUN chmod +x main.sh

RUN ./main.sh
CMD ["bore", "local", "14457", "--to", "bore.pub"]
